import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'refer.dart';

String url="https://covid19.mathdro.id/api/";
Future<Shape> fetchAlbum() async {
  final response =
      await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Shape.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
class Property{
  int vaalue;
  Property({this.vaalue});
  
  factory Property.fromJson(Map<String, dynamic> json){
  return Property(
    vaalue: json['value'],
   
  );
}
}
class Property1{
  int vaalue1;
  Property1({this.vaalue1});
  
  factory Property1.fromJson(Map<String, dynamic> json){
  return Property1(
    vaalue1: json['value'],
   
  );
}
}
class Property2{
  int vaalue2;
  Property2({this.vaalue2});
  
  factory Property2.fromJson(Map<String, dynamic> json){
  return Property2(
    vaalue2: json['value'],
   
  );
}
}


class Shape{
  Property proper;
  Property1 prop;
  Property2 pro;
  Shape({this.proper,this.prop,this.pro});
factory Shape.fromJson(Map<String, dynamic> parsedJson){
  return Shape(
     proper: Property.fromJson(parsedJson['confirmed']),
     prop: Property1.fromJson(parsedJson['recovered']),
     pro: Property2.fromJson(parsedJson['deaths']),
  );
}
}


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final myController = TextEditingController();
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Shape> futureAlbum;
  final myController = TextEditingController();
  @override
  void initState() {
    
    super.initState();
    futureAlbum = fetchAlbum();
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Corona Virus Tracker',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        body: Container( 
          child: ListView(
                      children:<Widget>[ Container(
              decoration:BoxDecoration(
               color:Colors.black,
              ),
              child: Column(
               
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50,),
                  RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "W",style: TextStyle(color:Color.fromRGBO(186, 0, 39, 1),fontSize: 40,fontWeight: FontWeight.bold)),
                    TextSpan(text: "O",style: TextStyle(color:Color.fromRGBO(186, 0, 39, 0.7),fontSize: 40,fontWeight: FontWeight.bold)),
                    TextSpan(text: "R",style: TextStyle(color:Color.fromRGBO(243, 171, 27, 1),fontSize: 40,fontWeight: FontWeight.bold)),
                    TextSpan(text: "L",style: TextStyle(color:Color.fromRGBO(86, 114, 237, 1),fontSize: 40,fontWeight: FontWeight.bold)),
                    TextSpan(text: "D ",style: TextStyle(color:Color.fromRGBO(207, 211, 212, 1),fontSize: 40,fontWeight: FontWeight.bold)),
                    TextSpan(text: " D",style: TextStyle(color:Color.fromRGBO(57, 181, 255, 1),fontSize: 40,fontWeight: FontWeight.bold)),
                    TextSpan(text: "A",style: TextStyle(color:Color.fromRGBO(19, 135, 8, 1),fontSize: 40,fontWeight: FontWeight.bold)),
                    TextSpan(text: "T",style: TextStyle(color:Color.fromRGBO(87, 193, 129, 1),fontSize: 40,fontWeight: FontWeight.bold)),
                    TextSpan(text: "A",style: TextStyle(color:Color.fromRGBO(87, 193, 129, 0.8),fontSize: 40,fontWeight: FontWeight.bold)),
                  ]
                  ),
                  ),
                  SizedBox(height:20),
                  FutureBuilder<Shape>(
                    future: futureAlbum,
                    builder: (context, snapshot){
                      if (snapshot.hasData) {
                        return  Column(
                          children: <Widget>[
                            Card(
                              elevation:8.0,
                              margin: EdgeInsets.symmetric(horizontal:10.0,vertical:6.0),
                              child: Container(
                                decoration:BoxDecoration(color:Color.fromRGBO(64, 75, 96, 0.9)),
                                child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(width: 1.0, color: Colors.white24))),
                                child: Icon(Icons.local_hotel, color: Colors.white),

                              ),
                              title: Text(
                              "Number Of Confirmed Cases",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Row(
                                    children: <Widget>[
                                      Icon(Icons.linear_scale, color: Colors.blue),
                                      Text("  ${snapshot.data.proper.vaalue}",style: TextStyle(color:Colors.blue),),
                                    ],
                                  ),
                            ),
                              ),
                            ),
                             Card(
                              elevation:8.0,
                              margin: EdgeInsets.symmetric(horizontal:10.0,vertical:6.0),
                              child: Container(
                                decoration:BoxDecoration(color:Color.fromRGBO(64, 75, 96, 0.9)),
                                child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(width: 1.0, color: Colors.white24))),
                                child: Icon(Icons.mood_bad, color: Colors.white),

                              ),
                              title: Text(
                              "Number Of Deaths",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Row(
                                    children: <Widget>[
                                      Icon(Icons.linear_scale, color: Colors.red),
                                      Text("  ${snapshot.data.pro.vaalue2}",style: TextStyle(color:Colors.red),),
                                    ],
                                  ),
                            
                            ),
                              ),
                            ),
                             Card(
                              elevation:8.0,
                              margin: EdgeInsets.symmetric(horizontal:10.0,vertical:6.0),
                              child: Container(
                                decoration:BoxDecoration(color:Color.fromRGBO(64, 75, 96, 0.9)),
                                child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(width: 1.0, color: Colors.white24))),
                                child: Icon(Icons.mood, color: Colors.white),

                              ),
                              title: Text(
                              "Number Of people Recovered",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Row(
                                    children: <Widget>[
                                      Icon(Icons.linear_scale, color: Colors.green),
                                      Text("  ${snapshot.data.prop.vaalue1}",style: TextStyle(color:Colors.green),),
                                    ],
                                  ),
                            ),
                              ),
                            ),
                             /*Text("Stay at Home 🏡", style: TextStyle(color:Colors.white),),
                             Text("Wash your 👐 regularly", style: TextStyle(color:Colors.white),),
                             Text("Prefer 👏 than 🤝", style: TextStyle(color:Colors.white),),*/
                             SizedBox(height:20),
                             Card(
                              elevation:8.0,
                              margin: EdgeInsets.symmetric(horizontal:10.0,vertical:6.0),
                              child: Container(
                                decoration:BoxDecoration(color:Color.fromRGBO(64, 75, 96, 0.9)),
                                child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                              leading: Container(
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(width: 1.0, color: Colors.white24))),
                                child: Icon(Icons.search, color: Colors.white),

                              ),
                              title: TextField(
                                controller: myController,
                              ),
                            subtitle: Row(
                                    children: <Widget>[
                                      Icon(Icons.linear_scale, color: Colors.green),
                                      Text("Enter Country",style: TextStyle(color:Colors.green),),
                                    ],
                                  ),
                            ),
                              ),
                            ),
                            RaisedButton(
                              padding: const EdgeInsets.all(8.0),
                              textColor: Colors.white,
                              color: Colors.green,
                              onPressed: (){
                                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecondPage(
                                  datea: myController.text,
                                )),
                            );
                              },
                              child: new Text("Search"),
                            ),
                          ],
                        );
                      }
                      return CircularProgressIndicator();
                    }
                  ),
                  
                   
                ],
              ),
            ),
         ] ),
        ),
      ),
    );
  }
}

/*
FutureBuilder<Shape>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return  
                        Column(children: <Widget>[
                          Padding(padding: EdgeInsets.only(left:40,right:50)),
                            Text("Total Number of Confirmed Cases in India", style: TextStyle(color: Colors.white,fontSize: 18,),),
                        Text("${snapshot.data.proper.vaalue}",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                         Text("Total Number of people recovered in India", style: TextStyle(color: Colors.green.shade700,fontSize: 18,),),
                        Text("${snapshot.data.prop.vaalue1}",style: TextStyle(color:Colors.green.shade800,fontWeight: FontWeight.bold,fontSize: 30),),
                        Text("Total Number of Deaths in India", style: TextStyle(color: Colors.red,fontSize: 18,),),
                        Text("${snapshot.data.pro.vaalue2}",style: TextStyle(color:Colors.red.shade800,fontWeight: FontWeight.bold,fontSize: 30),)
                          ],
                          );
                      
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),*/