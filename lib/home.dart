import 'package:flutter/material.dart';
import 'package:monsterkitchen/scan.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'database.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

  final String value;

  // receive data from the FirstScreen as a parameter
  HomePage({Key key, @required this.value}) : super(key: key);
}

logout(BuildContext context) {
  Navigator.pop(context);
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

  Color appBarColor =
      Color.fromARGB(500, 4, 183, 226);

  Color gradientStart = Colors.blue[400]; //Change start gradient color here
  Color gradientEnd = Colors.blue[500]; //Change end gradient color here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text('Hello, ${widget.value}!'.toUpperCase(),
            style: TextStyle(
                fontFamily: 'Raleway',
              )
            ),
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
              )
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
                          buttonColor: Colors.lightGreen,
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
                                  'Scan QR'.toUpperCase(),
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
