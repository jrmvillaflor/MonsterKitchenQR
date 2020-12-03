//import 'package:bookinder/genretest.dart';
//import 'package:monsterkitchen/home.dart';
//import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'database.dart';

void main() => runApp(MyApp());


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future getAccessToken(String url) async {
  HttpOverrides.global = new MyHttpOverrides();
}

final String url = "https://192.168.10.215/mk/userController";

class MyApp extends StatelessWidget {
  //SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MonsterKitchen',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'MonsterKitchen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
  
signupColor() {
  Color.fromARGB(500, 204, 51, 153);
}

class _MyHomePageState extends State<MyHomePage> {
  var allRows;
  final dbHelper = DatabaseHelper.instance;
  Map<String, dynamic> row;

  @override
  void initState() {
    super.initState();
  }

  Color gradientStart = Colors.blue; //Change start gradient color here
  Color gradientEnd = Colors.blue[300];
  //Change end gradient color here

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
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
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Image.asset(
                            'assets/images/monsterkitchenlogo.png',
                            height: 200),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Contact Tracing App'.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 15,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: ButtonTheme(
                          minWidth: 250.0,
                          height: 55.0,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    color: Color.fromARGB(500, 4, 183, 226),
                                    onPressed: () async {
                                      final url =
                                          "https://192.168.10.215/mk/adminController";
                                      getAccessToken(url);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                    child: Text("LOGIN",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontFamily: 'Raleway',
                                        )),
                                    textColor: Colors.white,
                                  ),
                              ),
                              FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  color: Color.fromARGB(500, 204, 51, 153),
                                  onPressed: () async {
                                    getAccessToken(url);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPage()),
                                    );
                                  },
                                  child: Text("SIGNUP",
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          fontFamily: 'Raleway')),
                                  textColor: Colors.white)
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
        ),
      ),
    );
  }
}
