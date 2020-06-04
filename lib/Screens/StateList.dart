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
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
           itemCount: data == null ? 0 : data.length,
            itemBuilder: (c, i) {
              return Card(
                child: GridTile(
                  
                  child: Column(
                    children: <Widget>[
                      
                      data[i]['state'].toString().length>18 ?
                      Text(data[i]['state'],textAlign: TextAlign.center,style: GoogleFonts.varelaRound(fontSize: 16,color:Colors.pink.shade600,fontWeight: FontWeight.w700),) :
                                      Text(data[i]['state'],textAlign: TextAlign.center,style: GoogleFonts.varelaRound(fontSize: 20,color:Colors.pink.shade600,fontWeight: FontWeight.w700),),
                      SizedBox(height: screenWidth*0.12,),
                      Container(
                       decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6)
                       ),
                        child: Padding(
                        padding: const EdgeInsets.only(left:5,right: 5),
                        child: Text("Confirmed  - "+data[i]['confirmed'],textAlign: TextAlign.center,style: GoogleFonts.varelaRound(fontSize: 16,color: Colors.white),),
                      )),
                      SizedBox(height: screenWidth*0.03,),
                      Container(
                       decoration: BoxDecoration(
                          color: Colors.yellow.shade700,
                          borderRadius: BorderRadius.circular(6)
                       ),
                        child: Padding(
                        padding: const EdgeInsets.only(left:5,right: 5),
                        child: Text("Recovered  - "+data[i]['recovered'],textAlign: TextAlign.center,style: GoogleFonts.varelaRound(fontSize: 16),),
                      )),
                      SizedBox(height: screenWidth*0.03,),
                      Container(
                       decoration: BoxDecoration(
                          color: Colors.blue.shade400,
                          borderRadius: BorderRadius.circular(6)
                       ),
                        child: Padding(
                        padding: const EdgeInsets.only(left:5,right: 5),
                        child: Text("Deaths  - "+data[i]['deaths'],textAlign: TextAlign.center,style: GoogleFonts.varelaRound(fontSize: 16,color: Colors.white),),
                      )),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
