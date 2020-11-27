//import 'package:monsterkitchen/login.dart';
import 'package:flutter/material.dart';
// import 'search.dart';
import 'database.dart';
// import 'add_book.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'login.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  //SharedPreferences sharedPreferences;
  var allRows;
  final dbHelper = DatabaseHelper.instance;
  Map<String, dynamic> row;
// ScrollController _sc = ScrollController();
// int _id;

  @override
  void initState() {
    super.initState();
    // checkLoginStatus();
  }


  Color gradientStart = Colors.blueGrey; //Change start gradient color here
  Color gradientEnd = Colors.blueGrey[900]; //Change end gradient color here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.blue,
          appBar: AppBar(backgroundColor: Colors.blueGrey[700]),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStart, gradientEnd],
                  begin: FractionalOffset(0.9, 0.0),
                  end: FractionalOffset(0.0, 0.7),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTheme(
                          buttonColor: Colors.brown,
                          minWidth: 220.0,
                          height: 80.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => null),
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'ADD READING',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Raleway'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ButtonTheme(
                          buttonColor: Colors.brown,
                          minWidth: 220.0,
                          height: 80.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => null),
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'OCR TEST',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Raleway'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
