import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(217, 26, 77, 1),
        title: Center(child: Text("Covid-19 | India",style: GoogleFonts.varelaRound(),)),
      ),
      body: Container(
       child: ListView(
         children: <Widget>[
           Column(
             children: <Widget>[
               Container(child: Image.asset("Images/covid.jpg"),width: screenWidth*0.6,),
             ],
           ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Text("Hello Everyone, as we all know Covid-19 is almost everywhere. So i would suggest you all to Stay Home 🏡 and Stay Safe",style: GoogleFonts.varelaRound(color:Colors.black87,fontSize: screenWidth*0.06,fontWeight: FontWeight.w300),),
           ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Text("Let's Fight against it together 🤝",style: GoogleFonts.varelaRound(color: Colors.pink,fontWeight: FontWeight.w900,fontSize: screenWidth*0.08,),textAlign: TextAlign.center,),
           )
         ],
       )
      ),
    );
  }
}