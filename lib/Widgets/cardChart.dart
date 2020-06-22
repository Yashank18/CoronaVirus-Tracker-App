import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class CardChart extends StatelessWidget {
final String title;
  final String number;
  final String name;
  final Color titleColor;
  final Color numberColor;
  final Color deltaNumberColor;
  var data;
  final Color lineColor;
  final Color pointColor;

  CardChart({
    Key key,
    this.title,
    this.number,
    this.name,
    this.deltaNumberColor,
    this.numberColor,
    this.titleColor,
    this.data,
    this.lineColor,
    this.pointColor,
  });


  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Container(
        height: screenWidth,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                
              ],
            ),
          ],
        ),
    );
    
  }
}