import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:mi.municipio/System/model/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:mi.municipio/widgets/scan.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:webview_flutter/webview_flutter.dart' ;

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar();
  _MyBottomNavigationBar createState() => _MyBottomNavigationBar();
}

class _MyBottomNavigationBar extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  String _url="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        
        initialUrl: '$_url',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            label: 'Checkpoint',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Escanear',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust_outlined),
            label: 'Ubicación',
          ),
        ],
      ),
    );
  }
  Future onTabTapped(int index) async {
    setState(() {
      _currentIndex = index;
    });

    print('Tocó:' + index.toString());
    switch (index) {
      case 0:
        Scan();
        break;
      case 1:
        scanQR();

        break;
      case 2: //ubicacion
        Scan();
        break;
    }
    print("aca2");
    print(_url);
  }
  Future<String> scanQR() async {
    String barcodeScanRes;
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);
    globals.res = barcodeScanRes;

    setState(() {
      _url = barcodeScanRes;
    });
    return barcodeScanRes;
  }


}
