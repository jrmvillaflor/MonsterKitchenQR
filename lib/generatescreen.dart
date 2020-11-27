import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
  final String value;

  // receive data from the FirstScreen as a parameter
  GeneratePage({Key key, @required this.value}) : super(key: key);
}

  Color appBarColor =
      Color.fromARGB(500, 4, 183, 226);

class GeneratePageState extends State<GeneratePage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          'CREATE YOUR OWN MK QRCODE',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 15,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                trailing: FlatButton(
                  
                  child: Text(
                    'Enter'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Color.fromARGB(500, 204, 51, 153),
                  onPressed: () {
                    setState(() {
                      dummyData =
                          '${widget.value}' == "" ? null : '${widget.value}';
                    });
                  },
                ),
                title: TextFormField(
                  initialValue: '${widget.value}',
                  decoration: InputDecoration(),
                ),
              ),
            ),
          ),
          (dummyData == null)
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'Make sure to Screenshot QR upon generating the code :)',
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Raleway',
                      fontSize: 20,
                    ),
                  ),
                ))
              : QrImage(
                  embeddedImage:
                      AssetImage('assets/images/monsterkitchenlogo.png'),
                  data: dummyData,
                  gapless: true,
                ),
        ],
      ),
    );
  }
}

String dummyData;
TextEditingController qrTextController = TextEditingController();
