import 'package:flutter/material.dart';
import 'package:mi.municipio/System/ui/screen/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        child: MyBottomNavigationBar(),
      ),
    );
  }
}
