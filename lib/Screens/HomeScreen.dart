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
         physics: BouncingScrollPhysics(),
         children: <Widget>[
           Column(
             children: <Widget>[
               Image.asset("Images/covid.png",width: screenWidth*0.6),
             ],
           ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Text("Hello Everyone, as we all know Covid-19 is almost everywhere. So i would suggest you all to Stay Home 🏡 and Stay Safe",style: GoogleFonts.varelaRound(color:Colors.black87,fontSize: screenWidth*0.06,fontWeight: FontWeight.w300),),
           ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Text("Let's Fight against it together 🤝",style: GoogleFonts.varelaRound(color: Colors.pink,fontWeight: FontWeight.w900,fontSize: screenWidth*0.08,),textAlign: TextAlign.center,),
           ),
           SizedBox(height: screenHeight*0.01,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               Container(
                 decoration: BoxDecoration(
                   color: Colors.green.shade400,
                   borderRadius: BorderRadius.circular(30)
                 ),
                 child: Padding(
                 padding: const EdgeInsets.all(6.0),
                 child: Text("#GoKarunaGo",style: GoogleFonts.varelaRound(color:Colors.white),),
               ),
               ),
               Container(
                 decoration: BoxDecoration(
                   color: Colors.blue.shade400,
                   borderRadius: BorderRadius.circular(30)
                 ),
                 child: Padding(
                 padding: const EdgeInsets.all(6.0),
                 child: Text("#LetsFightTogether",style: GoogleFonts.varelaRound(color:Colors.white)),
               ),
               ),
               Container(
                 decoration: BoxDecoration(
                   color: Colors.yellow.shade800,
                   borderRadius: BorderRadius.circular(30)
                 ),
                 child: Padding(
                 padding: const EdgeInsets.all(6.0),
                 child: Text("#Lockdown",style: GoogleFonts.varelaRound(color:Colors.white)),
               ),
               ),
             ],
           ),
           Column(
             
             children: <Widget>[
               SizedBox(height: screenHeight*0.02,),
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Container(
                   width: screenWidth*0.4,
                   decoration: BoxDecoration(
                     color:Color.fromRGBO(217, 26, 77, 1),
                     borderRadius: BorderRadius.circular(20)
                   ),
                   child: Text("India Report",style: GoogleFonts.amaticSc(fontSize: screenHeight*0.04,color: Colors.white,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                 ),
               ),
               Image.asset("Images/covidMap.png"),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   width: screenWidth*0.8,
                   decoration: BoxDecoration(
                    color: Colors.yellow.shade800,
                    borderRadius: BorderRadius.circular(15)
                   ),
                   child: Row(
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("Confirmed Cases",style: GoogleFonts.varelaRound(fontSize: screenWidth*0.06),),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left:18.0),
                         child: Container(
                           color: Colors.white,
                           child:Padding(
                             padding: const EdgeInsets.all(2.0),
                             child: Text("200000",style: TextStyle(fontSize: screenWidth*0.04),),
                           )
                         ),
                       )
                     ],
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   width: screenWidth*0.8,
                   decoration: BoxDecoration(
                    color: Colors.green.shade500,
                    borderRadius: BorderRadius.circular(15)
                   ),
                   child: Row(
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("Recovered Cases",style: GoogleFonts.varelaRound(fontSize: screenWidth*0.06,color:Colors.white),),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left:18.0),
                         child: Container(
                           color: Colors.white,
                           child:Padding(
                             padding: const EdgeInsets.all(2.0),
                             child: Text("200000",style: TextStyle(fontSize: screenWidth*0.04),),
                           )
                         ),
                       )
                     ],
                   ),
                 ),
               ),
             ],
           )
         ],
       )
      ),
    );
  }
}