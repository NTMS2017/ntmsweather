
// FLUTER IMPORT
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(new CapitalApp());
}

class CapitalApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CapitalApp',
      theme: new ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.lightBlue,
      ),
      home: new MyHomePage(title: 'CapitalApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var weatherData;
  Future<String> getWeatherData() async {
    var response = await http.get(
        Uri.encodeFull("http://api.openweathermap.org/data/2.5/forecast?q=San+Francisco&units=metric&APPID=14cc828bff4e71286219858975c3e89a"),
        headers: {
          'Accept': 'application/json'
        }
    );

    this.setState(() {
      weatherData = json.decode(response.body);
    });

    print(weatherData['list'][0]['main']['temp_min']);

    return 'Success!';
  }
  // ***************************************************************************

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getWeatherData();
  }

  // ***************************************************************************

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.lightBlue,
      // APP BAR
      appBar: new AppBar(
        elevation: 1.0,
        // TITLE
        title: new Container(
          child: new Text ('CAPITAL WEATHER'),
        ),

        actions: <Widget>[

          // SEARCH
          new IconButton(
            color: Colors.white,
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),


      // BODY ##################################################################
      body: new Stack(children: <Widget>[

        new ListView(
          padding: const EdgeInsets.all(5.0),
          children: [

            // WEATHER SECTION ***************************************************
            new Card(
              elevation: 0.7,
              margin: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0),
              color: new Color.fromRGBO(3, 169, 244, 0.4),
              child: new GestureDetector(
                  onTap: () {
                  },
                  child: new Container(
                      padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                      child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[

                            // ITEM-0
                            new Column(
                              children: <Widget>[
                                new Text(
                                  weatherData['list'][0]['main']['temp_max'].toString(),
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][0]['main']['temp_min'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                new Container(
                                  margin: new EdgeInsets.fromLTRB(
                                      5.0, 10.0, 5.0, 10.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Image.asset(
                                        'images/weather/0.png',
                                        scale: 2.5,
                                      ),
                                    ],
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][0]['main']['pressure'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][0]['main']['temp_kf'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),


                            // ITEM-1
                            new Column(
                              children: <Widget>[
                                new Text(
                                  weatherData['list'][1]['main']['temp_max'].toString(),
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][1]['main']['temp_min'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                new Container(
                                  margin: new EdgeInsets.fromLTRB(
                                      5.0, 10.0, 5.0, 10.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Image.asset(
                                        'images/weather/1.png',
                                        scale: 2.5,
                                      ),
                                    ],
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][1]['main']['pressure'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][1]['main']['temp_kf'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),


                            // ITEM-2
                            new Column(
                              children: <Widget>[
                                new Text(
                                  weatherData['list'][2]['main']['temp_max'].toString(),
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][2]['main']['temp_min'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                new Container(
                                  margin: new EdgeInsets.fromLTRB(
                                      5.0, 10.0, 5.0, 10.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Image.asset(
                                        'images/weather/2.png',
                                        scale: 2.5,
                                      ),
                                    ],
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][2]['main']['pressure'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][2]['main']['temp_kf'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            // ITEM-3
                            new Column(
                              children: <Widget>[
                                new Text(
                                  weatherData['list'][3]['main']['temp_max'].toString(),
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][3]['main']['temp_min'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                new Container(
                                  margin: new EdgeInsets.fromLTRB(
                                      5.0, 10.0, 5.0, 10.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Image.asset(
                                        'images/weather/3.png',
                                        scale: 2.5,
                                      ),
                                    ],
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][3]['main']['pressure'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                new Text(
                                  weatherData['list'][3]['main']['temp_kf'].toString(),
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),



                          ]))
              ),
            ),

          ],
        )
      ]),

    );
  }
}

