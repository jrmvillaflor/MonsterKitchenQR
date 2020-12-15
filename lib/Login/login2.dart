import 'package:flutter/material.dart';

import 'login.dart';
import 'login3.dart';


class SelectLoginPage extends StatefulWidget {
  SelectLoginPage();

  @override
  State<StatefulWidget> createState() {
    return SelectLoginPageState();
  }
}


class SelectLoginPageState extends State<SelectLoginPage> {
  
  @override
  void initState() {
    super.initState();
  }

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
          body: Form(
              child: Container(
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
                        padding: const EdgeInsets.only(bottom: 50),
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
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: ButtonTheme(
                          buttonColor: Color.fromARGB(500, 4, 183, 226),
                          minWidth: 310.0,
                          height: 50.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () async {
                              Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CustomerLoginPage()
                                        ),
                                      );
                            },
                            child: Text(
                              'LOGIN AS CUSTOMER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Raleway'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                        child: ButtonTheme(
                          buttonColor: Colors.purple,
                          minWidth: 310.0,
                          height: 50.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () async {
                              Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()
                                        ),
                                      );
                            },
                            child: Text(
                              'LOGIN AS ADMIN',
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
          ),
        ));
  }
}
