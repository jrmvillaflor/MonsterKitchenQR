import 'package:flutter/material.dart';
import 'generatescreen.dart';
//import 'scan.dart';
import 'user.dart';

class UserHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserHomePageState();
  }

  final User value;

  UserHomePage({Key key, @required this.value}) : super(key: key);
}

class UserHomePageState extends State<UserHomePage> {
  final String url =
      "https://monsterkitchen.000webhostapp.com/mk/userController";

  List userList;
  Map userMap;

  @override
  void initState() {
    super.initState();
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
          title: Text('Profile Information'.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Raleway'
          )),
          
          backgroundColor: appBarColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,10,50),
                        child: Text(
                           '${widget.value.fullname}\n' +
                            '${widget.value.address}\n' +
                            '${widget.value.contactnumber}',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 20,
                              wordSpacing: 3,
                              color: Colors.white
                            ),),
                      ),
                      ButtonTheme(
                        buttonColor: Color.fromARGB(500, 204, 51, 153),
                        minWidth: 280.0,
                        height: 60.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GeneratePage(
                                        value: User(
                                            fullname:
                                                '${widget.value.fullname}'),
                                      )),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Text('GENERATE QR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Raleway',
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text('Dont forget to save QR image upon generating ;)',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontSize: 12,
                              fontStyle: FontStyle.italic
                            ),)
                          ],
                        ),
                      )
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
