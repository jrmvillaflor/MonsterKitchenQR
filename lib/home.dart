import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:monsterkitchen/scan.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
//import 'database.dart';
import 'package:http/http.dart' as https;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

  final String value;

  HomePage({Key key, @required this.value}) : super(key: key);
}

logout(BuildContext context) {
  Navigator.pop(context);
}

class HomePageState extends State<HomePage> {
  StreamController<Map> _streamController = StreamController<Map>();
  

  final String url = "https://192.168.10.215/mk/adminController";

  List userList;
  Map userMap;

  @override
  void initState() {
    super.initState();
    getAllDatas();

  }

  getAllDatas() async {
    final response = await https.get(url);

    userMap = json.decode(response.body);
    userList = userMap.values.toList();

    _streamController.add(userMap);
  }


  Color appBarColor = Color.fromARGB(500, 4, 183, 226);

  Color gradientStart = Colors.blue[400];
  Color gradientEnd = Colors.blue[500];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Hello, ${widget.value}!'.toUpperCase(),
              style: TextStyle(
                fontFamily: 'Raleway',
              )),
          backgroundColor: appBarColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                logout(context);
              },
            ),
          ],
        ),
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
                        buttonColor: Color.fromARGB(500, 204, 51, 153),
                        minWidth: 280.0,
                        height: 80.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScanPage()),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(MaterialCommunityIcons.qrcode_scan,
                                    color: Colors.white),
                              ),
                              Text(
                                'Scan QR \n '.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 25,
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
        ),
      ),
    );
  }
}
