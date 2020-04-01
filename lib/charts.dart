import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Poll, String>> _seriesData;
  List<charts.Series<Days, String>> _seriesPieData_;

  _generateData() {
    var data1 = [
      new Poll(2020, 'Punjab', 30),
      new Poll(2020, 'J&K', 40),
      new Poll(2020, 'Tamil\nNadu', 100),
      new Poll(2020, 'Delhi', 10),
      new Poll(2020, 'Uttar\nPradesh', 100),
      new Poll(2020, 'Haryana', 10),
    ];
    var data2 = [
      new Poll(2020, 'Punjab', 100),
      new Poll(2020, 'J&K', 150),
      new Poll(2020, 'Tamil\nNadu', 80),
      new Poll(2020, 'Delhi', 60),
      new Poll(2020, 'Uttar\nPradesh', 110),
      new Poll(2020, 'Haryana', 10),
    ];
    var data3 = [
      new Poll(2020, 'Punjab', 200),
      new Poll(2020, 'J&K', 300),
      new Poll(2020, 'Tamil\nNadu', 180),
      new Poll(2020, 'Delhi', 120),
      new Poll(2020, 'Uttar\nPradesh', 80),
      new Poll(2020, 'Haryana', 10),
    ];
    var data4 = [
      new Poll(2020, 'Punjab', 200),
      new Poll(2020, 'J&K', 300),
      new Poll(2020, 'Tamil\nNadu', 480),
      new Poll(2020, 'Delhi', 110),
      new Poll(2020, 'Uttar\nPradesh', 10),
      new Poll(2020, 'Haryana', 10),
    ];
    var data5 = [
      new Poll(2020, 'Punjab', 110),
      new Poll(2020, 'J&K', 350),
      new Poll(2020, 'Tamil\nNadu', 80),
      new Poll(2020, 'Delhi', 50),
      new Poll(2020, 'Uttar\nPradesh', 90),
      new Poll(2020, 'Haryana', 100),
    ];
    var data6 = [
      new Poll(2020, 'Punjab', 110),
      new Poll(2020, 'J&K', 200),
      new Poll(2020, 'Tamil\nNadu', 580),
      new Poll(2020, 'Delhi', 20),
      new Poll(2020, 'Uttar\nPradesh', 100),
      new Poll(2020, 'Haryana', 110),
    ];


    var piedata = [
      new Task('Punjab', 35.8, Color(0xff3366cc)),
      new Task(' Delhi', 8.3, Color(0xff990099)),
      new Task('J&K', 10.8, Color(0xff109618)),
      new Task('Uttar\nPradesh', 15.6, Color(0xfffdbe19)),
      new Task('Tamil\nNadu', 19.2, Color(0xffff9900)),
      new Task('Haryana', 10.3, Color(0xffdc3912)),
    ];

    var piedata_= [
      new Days('Days up', 52.3, Color(0xff3366cc)),
      new Days('Days Left',47.7, Color(0xff990099)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'State Cases',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Poll poll, _) => poll.place,
        measureFn: (Poll poll, _) => poll.quantity,
        id: 'Death',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Poll poll, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Poll poll, _) => poll.place,
        measureFn: (Poll poll, _) => poll.quantity,
        id: 'Recovery',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Poll poll, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesPieData_.add(
      charts.Series(
        domainFn: (Days days, _) => days.days,
        measureFn: (Days days, _) => days.daysvalue,
        colorFn: (Days days, _) =>
            charts.ColorUtil.fromDartColor(days.colorval),
        id: 'Lockdown Days',
        data: piedata_,
        labelAccessorFn: (Days row, _) => '${row.daysvalue}',
      ),
    );

  }
  Material chart3Items(){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0xFF42A5F5),
      child: Center(
          child:
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'Lockdown Days\n\n',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10.0,),
                  Expanded(
                    child: charts.PieChart(
                        _seriesPieData_,
                        animate: true,
                        animationDuration: Duration(seconds: 1),
                        behaviors: [
                          new charts.DatumLegend(
                            outsideJustification: charts.OutsideJustification.endDrawArea,
                            horizontalFirst: false,
                            desiredMaxRows: 2,
                            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                            entryTextStyle: charts.TextStyleSpec(
                                color: charts.MaterialPalette.purple.shadeDefault,
                                fontFamily: 'Georgia',
                                fontSize: 11),
                          )
                        ],
                        defaultRenderer: new charts.ArcRendererConfig(
                            arcWidth: 100,
                            arcRendererDecorators: [
                              new charts.ArcLabelDecorator(
                                  labelPosition: charts.ArcLabelPosition.inside)
                            ])),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }



  Material chart2Items() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Statewise confirmed cases\n',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                SizedBox(height: 10.0,),
                Expanded(
                  child: charts.PieChart(
                    _seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 1),
                    behaviors: [
                      new charts.DatumLegend(
                        outsideJustification: charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: 3,
                        cellPadding: new EdgeInsets.only(left:9.0, right: 3.0, bottom: 4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontFamily: 'Georgia',
                            fontSize: 9),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Material chart1Items() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Death,Recovery',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                Expanded(
                  child: charts.BarChart(
                    _seriesData,
                    animate: true,
                    barGroupingType: charts.BarGroupingType.grouped,
                    //behaviors: [new charts.SeriesLegend()],
                    animationDuration: Duration(seconds: 2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesData = List<charts.Series<Poll, String>>();
    _seriesPieData_ = List<charts.Series<Days, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {
          //
        }),
        title: Text('Charts'),
        actions: <Widget>[
//          IconButton(icon: Icon(
//              FontAwesomeIcons.chartLine), onPressed: () {
//            //
//          }),
        ],
      ),
      backgroundColor: Colors.black38,
      body:Container(
        child:StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: chart1Items(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: chart2Items(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: chart3Items(),
            ),

          ],
          staggeredTiles: [
            StaggeredTile.extent(4, 250.0),
            StaggeredTile.extent(2, 350.0),
            StaggeredTile.extent(2, 350.0),
          ],
        ),
      ),
    );
  }
}
class Poll {
  String place;
  int year;
  int quantity;

  Poll(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Days {
  String days;
  double daysvalue;
  Color colorval;

  Days(this.days, this.daysvalue, this.colorval);
}
