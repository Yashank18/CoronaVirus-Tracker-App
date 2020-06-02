import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _countryName;
  int _confirmedCases = 0;
  int _recoverdCases = 0;

  Future<Position> getUserCurrentLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    return position;
  }

  Future<String> getCountryNameFromLocation(Coordinates coordinates) async {
    final location = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return location.first.countryName;
  }

  void getCovidStats(String countryName) async {
    String url = "https://api.covid19api.com/country/${countryName}";
    final response = await http.get(url);
    final parsed = json.decode(response.body);

    List<CovidData> covid_data = (parsed as List).map((e) => new CovidData(
        Active: e['Active'],
        Confirmed: e['Confirmed'],
        Country: e['Country'],
        Date: e['Date'],
        Deaths: e['Deaths'],
        Recovered: e['Deaths']
    )).toList();

    int recover_sum = 0;
    int active_sum = 0;
    int affected_sum = 0;
    int death_sum = 0;

    covid_data.forEach((value) => recover_sum = recover_sum + value.Recovered);
    covid_data.forEach((value) => active_sum = active_sum + value.Active);
    covid_data.forEach((value) => affected_sum = affected_sum + value.Confirmed);
    covid_data.forEach((value) => death_sum = death_sum + value.Deaths);

    setState(() {
      _recoverdCases = recover_sum;
      _confirmedCases = active_sum;
    });

  }

  void updateCountry() async {
    Position position = await getUserCurrentLocation();
    String countryName = await getCountryNameFromLocation(new Coordinates(position.latitude, position.longitude));
    setState(() {
      _countryName = countryName;
    });

    getCovidStats(countryName);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateCountry();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(217, 26, 77, 1),
        title: Center(child: Text("Covid-19 | ${_countryName}",style: GoogleFonts.varelaRound(),)),
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
                   child: Text("${_countryName} Report",style: GoogleFonts.amaticSc(fontSize: screenHeight*0.04,color: Colors.white,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
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
                             child: Text(_confirmedCases.toString() ,style: TextStyle(fontSize: screenWidth*0.04),),
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
                             child: Text(_recoverdCases.toString(), style: TextStyle(fontSize: screenWidth*0.04),),
                           )
                         ),
                       )
                     ],
                   ),
                 ),
               ),
               
             ],
           ),

           Column(
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: Container(
                   width: screenWidth*0.4,
                   child: MaterialButton(
                     onPressed: (){},
                     color: Colors.blue,
                     child: Text("State Data",style: GoogleFonts.varelaRound(color:Colors.white,fontSize: screenWidth*0.06),),
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

class CovidData {
  String Country;
  int Confirmed = 0;
  int Deaths = 0;
  int Recovered = 0;
  int Active = 0;
  String Date = "";

  CovidData({this.Country, this.Confirmed, this.Active, this.Date, this.Deaths, this.Recovered});


}