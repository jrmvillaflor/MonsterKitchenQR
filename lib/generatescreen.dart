import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
  final String value;

  // receive data from the FirstScreen as a parameter
  GeneratePage({Key key, @required this.value}) : super(key: key);
}

Color appBarColor = Color.fromARGB(500, 4, 183, 226);

class GeneratePageState extends State<GeneratePage> {
  static GlobalKey screen = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
              IconButton(
                icon: Icon( 
                  Icons.save_alt,
                  color: Colors.white,
                ),
                onPressed: () {
                  screenShot();
                },
              ),
            ],
        backgroundColor: appBarColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 130),
          child: Text(
            'SAVE QR IMAGE',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 15,
            ),
          ),
        ),
      ),
      body: RepaintBoundary(
        key: screen,
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
                      'Make sure to Screenshot QR upon generating the code :)'
                          .toUpperCase(),
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
      ),
    );
  }

  screenShot() async {  
    RenderRepaintBoundary boundary = screen.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    var filePath = await ImagePickerSaver.saveFile(
        fileData: byteData.buffer.asUint8List());
    print(filePath);
  }
}

String dummyData;
TextEditingController qrTextController = TextEditingController();
