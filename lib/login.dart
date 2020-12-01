//import 'package:bookinder/database.dart';
//import 'package:bookinder/mylist.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';
import 'home.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

Future getAccessToken(String url) async {
  HttpClient client = new HttpClient();
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
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

  @override
  void initState() {
    super.initState();
    getAllDatas();
    getAccessToken(url);
  }

  getAllDatas() async {
    getAccessToken(url);

    final response = await https.get(url);

    userMap = json.decode(response.body);
    userList = userMap.values.toList();
  }

  check(List alluser, String username, String password, String branch) {
    getAccessToken(url);
    int index = 0;
    while (alluser.length - 1 > index) {
      if (userUSERNAME.text == alluser[index][username]) {
        if (userPASSWORD.text == alluser[index][password]) {
          return index;
        }
      }
      if (index < alluser.length) {
        index++;
      }
    }
    return false;
  }

  validate() async {
    getAccessToken(url);
    var successUser = check(userList, 'userUSERNAME', 'userPASSWORD', 'branch');
    if (successUser != false) {
      print(userList[successUser]['userUSERNAME']);
      print(userList[successUser]['branch']);
      // Map<String, dynamic> row = {
      //   DatabaseHelper.columnUsername: userList[successUser]['userUSERNAME'],
      //   DatabaseHelper.columnPassword: userList[successUser]['userPASSWORD'],
      // };
      // final value = await dbHelper.insert(row);
      // print('inserted row id: $value');

      showToastLoginSuccess();
      var route = new MaterialPageRoute(
        builder: (BuildContext context) =>
            new HomePage(value: userList[successUser]['userUSERNAME']),
      );
      Navigator.of(context).push(route);
    } else {
      showToastLoginFailed();
    }
  }

  void showToastLoginSuccess() {
    Fluttertoast.showToast(
        msg: 'Login Sucessful',
        backgroundColor: Colors.white,
        textColor: Colors.black,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG);
  }

  void showToastLoginFailed() {
    Fluttertoast.showToast(
        msg: 'Login Failed',
        backgroundColor: Colors.white,
        textColor: Colors.black,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG);
  }

  // signIn(String userUSERNAME, userPASSWORD) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   Map data = {
  //     'userUSERNAME': userUSERNAME,
  //     'userPASSWORD': userPASSWORD
  //   };
  //   var jsonResponse = null;
  //   var response = await https.post(url, body: data);
  //   if(response.statusCode == 200) {
  //     jsonResponse = json.decode(response.body);
  //     if(jsonResponse != null) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       sharedPreferences.setString("token", jsonResponse['token']);
  //       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
  //     }
  //   }
  //   else {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     print(response.body);
  //   }
  // }

  Color gradientStart = Colors.blue;
  Color gradientEnd = Colors.blue[300];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Image.asset(
                          'assets/images/monsterkitchenlabel.png',
                          height: 100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'Contact Tracing App'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Raleway'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Raleway'),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          fillColor: Colors.black12,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
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
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Raleway'),
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          filled: true,
                          fillColor: Colors.black12,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
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
                        buttonColor: Color.fromARGB(500, 4, 183, 226),
                        minWidth: 310.0,
                        height: 50.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () async {
                            getAccessToken(url);
                            validate();
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
