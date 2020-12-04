// import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
  final String value;
  GeneratePage({Key key, @required this.value}) : super(key: key);
}

String dummyData;
TextEditingController qrTextController = TextEditingController();
Color appBarColor = Color.fromARGB(500, 4, 183, 226);

class GeneratePageState extends State<GeneratePage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      dummyData = null;
    });
  }

  static GlobalKey _previewContainer = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: <Widget>[],
        backgroundColor: appBarColor,
        title: Text(
          'Welcome ${widget.value}',
          style: TextStyle(fontFamily: 'Raleway', fontSize: 12),
        ),
      ),
      body: RepaintBoundary(
        key: _previewContainer,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: ListTile(
                  trailing: FlatButton(
                    child: Text(
                      'Generate QR'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
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
                        'Make sure to Screenshot QR upon generating the code'
                            .toUpperCase(),
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Raleway',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                : QrImage(
                    embeddedImage:
                        AssetImage('assets/images/monsterkitchenlogo.png'),
                    data: dummyData,
                    gapless: true,
                  ),
          ],
        ),
      ),
    );
  }
}
