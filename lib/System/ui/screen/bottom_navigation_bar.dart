import 'package:flutter/material.dart';
import 'package:mi.municipio/widgets/scan.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar();
  _MyBottomNavigationBar createState() => _MyBottomNavigationBar();
}

class _MyBottomNavigationBar extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            label: 'Checkpointt',
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
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);
    print(barcodeScanRes);

    if (!mounted) return;
  }
}
