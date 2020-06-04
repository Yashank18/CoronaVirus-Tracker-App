import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Statelist extends StatefulWidget {
  Statelist({Key key}) : super(key: key);

  @override
  _StatelistState createState() => _StatelistState();
}

class _StatelistState extends State<Statelist> {
  
List data;

   Future<String> getJSONData() async {
    var response = await http.get(
      Uri.encodeFull("https://api.covid19india.org/data.json"),
    );

    setState(() {
      // Get the JSON data
      
      data = json.decode(response.body)['statewise'];
    });

    return "Successfull";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJSONData();
    
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
       appBar: new AppBar(
        backgroundColor: Color.fromRGBO(217, 26, 77, 1),
        title: Text("StateWise Report",style: GoogleFonts.varelaRound()),
      ),
      body: Container(
        height: screenHeight,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
           itemCount: data == null ? 0 : data.length,
            itemBuilder: (c, i) {
              return Card(
                child: GridTile(
                  footer: Text(data[i]['confirmed'],textAlign: TextAlign.center,),
                  child: Text(data[i]['state'],textAlign: TextAlign.center,style: GoogleFonts.varelaRound(fontSize: 20),),
                ),
              );
            }
        ),
      ),
    );
  }
}
