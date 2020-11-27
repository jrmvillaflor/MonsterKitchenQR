//import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'login.dart';
import 'package:http/http.dart' as https;
import 'dart:async';
import 'generatescreen.dart';
//import 'package:qr_flutter/qr_flutter.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage();

  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  final userFNAME = TextEditingController();
  final userADDRESS = TextEditingController();
  final userCONTACTNUMBER = TextEditingController();

  String dummyData;
  TextEditingController qrTextController = TextEditingController();

  final String url = "http://192.168.10.215/mk/userController";

  bool isUpdating = false;
  Map data;
  int id;

  passData() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) =>
          new GeneratePage(value: userFNAME.text),
    );
    Navigator.of(context).push(route);
  }

  Future<dynamic> adduser() async {
    String userfname = userFNAME.text;
    String usercontact = userCONTACTNUMBER.text;
    String useraddr = userADDRESS.text;

    Map<String, String> headers = {
      "Content-type": "application/x-www-form-urlencoded"
    };
    Map<String, dynamic> adduser = {
      "userFNAME": "$userfname",
      "userADDRESS": "$useraddr",
      "userCONTACTNUMBER": "$usercontact",
    };
    final response = await https.post(url, headers: headers, body: adduser);
    int statusCode = response.statusCode;

    print(statusCode);

    print(response);
  }

  Color gradientStart = Colors.blue;
  Color gradientEnd = Colors.blue[300];
  // bool enableBtn = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.blue,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStart, gradientEnd],
                  begin: FractionalOffset(0.9, 0.0),
                  end: FractionalOffset(0.0, 0.7),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/monsterkitchenlabel.png',
                            width: 250,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Please enter valid Name' : null,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            filled: true,
                            fillColor: Colors.black12,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent),
                            ),
                            labelText: "Full Name",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontSize: 13,
                            )),
                        controller: userFNAME,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'Please enter valid Address' : null,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            filled: true,
                            fillColor: Colors.black12,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent),
                            ),
                            labelText: "Complete Address",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontSize: 13,
                            )),
                        controller: userADDRESS,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.length != 11)
                            return 'Mobile Number must be of 11 digit';
                          else
                            return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            filled: true,
                            fillColor: Colors.black12,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent),
                            ),
                            labelText: "Mobile Number",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontSize: 13,
                            )),
                        controller: userCONTACTNUMBER,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: ButtonTheme(
                        buttonColor: Color.fromARGB(500, 204, 51, 153),
                        minWidth: 300.0,
                        height: 50.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () async {

                            passData();
                            adduser();
                          },
                          child: Text(
                            'Signup to Generate QR',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.all(10.0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => LoginPage()),
                    //       );
                    //     },
                    //     child: Text(
                    //       'LOGIN HERE',
                    //       style: TextStyle(
                    //           fontSize: 13,
                    //           color: Colors.white54,
                    //           fontFamily: 'Raleway'),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
