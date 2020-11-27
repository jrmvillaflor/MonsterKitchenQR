//import 'package:monsterkitchen/home.dart';
import 'package:monsterkitchen/database.dart';
//import 'package:bookinder/mylist.dart';
import 'package:flutter/material.dart';
import 'database.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:http/http.dart' as https;
//import 'dart:convert';
import 'package:monsterkitchen/signup.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter/services.dart';
//import 'package:bookinder/models/user.dart';

// lass User {
//   final String username;
//   final String password;

//   User({this.username, this.password});

//   factory User.getData(Map<String, dynamic> json) {
//     return User(
//         username: json['userUSERNAME'],
//         password: json['userPASSWORD']);
//   }
// }

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  //final username = TextEditingController();
  //final password = TextEditingController();
  //final dbHelper = DatabaseHelper.instance;
  // List allRows;
  final String url = "https://192.168.10.215/mk/adminController";
//Map data;
  List userList;
  Map userMap;
  final dbHelper = DatabaseHelper.instance;
//bool _isLoading = false;

  final userUSERNAME = TextEditingController();
  final userPASSWORD = TextEditingController();
  final userEMAIL = TextEditingController();
  final userFNAME = TextEditingController();
  final userLNAME = TextEditingController();
  final userCONTACTNUMBER = TextEditingController();

  

  Color gradientStart = Colors.blueGrey;
  Color gradientEnd = Colors.blueGrey[900];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
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
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: TextFormField(
                      style: TextStyle(color: Colors.lightBlue),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.black12,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.transparent),
                        ),
                        labelText: "Username",
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Raleway'),
                      ),
                      controller: userUSERNAME,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: TextFormField(
                      style: TextStyle(color: Colors.lightBlue),
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.black12,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.transparent),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Raleway'),
                      ),
                      controller: userPASSWORD,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: ButtonTheme(
                      buttonColor: Colors.teal,
                      minWidth: 300.0,
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Raleway'),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      'SIGNUP HERE',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white54,
                          fontFamily: 'Raleway'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
