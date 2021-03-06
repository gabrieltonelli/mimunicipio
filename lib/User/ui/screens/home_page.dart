import 'package:flutter/material.dart';
import 'package:mi.municipio/System/ui/screen/bottom_navigation_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:mi.municipio/System/model/globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _url = globals.res;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: '$_url',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
