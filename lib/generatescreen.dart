import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:monsterkitchen/user.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
  final User value;
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
    _requestPermission();
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }

  _toastInfo() {
    Fluttertoast.showToast(
        msg: 'QR image saved to gallery!', toastLength: Toast.LENGTH_LONG);
  }

  _saveScreen() async {
    RenderRepaintBoundary boundary =
        _previewContainer.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final result =
        await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
    print(result);
    _toastInfo();
  }

  static GlobalKey _previewContainer = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        actions: <Widget>[],
        backgroundColor: appBarColor,
        title: Text(
          'Welcome ${widget.value.fullname}',
          style: TextStyle(fontFamily: 'Raleway', fontSize: 12),
        ),
      ),
      body: RepaintBoundary(
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
                        dummyData = '${widget.value.fullname}' == ""
                            ? null
                            : '${widget.value.fullname}';
                      });
                    },
                  ),
                  title: TextFormField(
                    initialValue: '${widget.value.fullname}',
                    decoration: InputDecoration(),
                  ),
                ),
              ),
            ),
            (dummyData == null)
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(''),
                    ),
                  )
                : RepaintBoundary(
                    key: _previewContainer,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        
                        children: [
                          Text('${widget.value.fullname}'.toUpperCase(),
                              style: TextStyle(backgroundColor: Colors.white)),
                          QrImage(
                            backgroundColor: CupertinoColors.white,
                            embeddedImage: AssetImage(
                                'assets/images/monsterkitchenlogo.png'),
                            data: dummyData,
                            gapless: true,
                          ),
                        ],
                      ),
                    ),
                  ),
            (dummyData == null)
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(''),
                    ),
                  )
                : Container(
                    child: RaisedButton(
                      color: Colors.purpleAccent,
                      onPressed: () {
                        _saveScreen();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Save to Gallery'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Raleway'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Icon(
                              Icons.download_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
