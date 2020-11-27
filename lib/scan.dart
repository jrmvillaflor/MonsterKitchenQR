import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult;
  bool backCamera = true;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

    Color appBarColor =
      Color.fromARGB(500, 4, 183, 226);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: Text(
            "Scan using: " + (backCamera ? "Front Cam" : "Back Cam"),
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Raleway'
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: backCamera
                  ? Icon(Ionicons.ios_reverse_camera)
                  : Icon(Icons.camera),
              onPressed: () {
                setState(() {
                  backCamera = !backCamera;
                  camera = backCamera ? 1 : -1;
                });
              },
            ),
            IconButton(
              icon: Icon(MaterialCommunityIcons.qrcode_scan),
              onPressed: () {
                _scan();
              },
            )
          ],
        ),
        body: Center(
          child: Text(
            (qrCodeResult == null) || (qrCodeResult == "")
                ? "Please Scan to show some result".toUpperCase()
                : "Result: $formattedDate" + qrCodeResult.toUpperCase(),
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w900,
                fontFamily: 'Raleway'),
          ),
        ));
  }



  Future<void> _scan() async {
    ScanResult codeSanner = await BarcodeScanner.scan(
      options: ScanOptions(
        useCamera: camera,
      ),
    );
    setState(() {
      qrCodeResult = codeSanner.rawContent;
      

    });
  }
}

int camera = 1;
