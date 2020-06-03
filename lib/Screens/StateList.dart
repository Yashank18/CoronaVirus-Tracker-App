import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Statelist extends StatefulWidget {
  Statelist({Key key}) : super(key: key);

  @override
  _StatelistState createState() => _StatelistState();
}

class _StatelistState extends State<Statelist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(
        backgroundColor: Color.fromRGBO(217, 26, 77, 1),
        title: Text("StateWise Report",style: GoogleFonts.varelaRound()),
      ),
    );
  }
}