import 'package:flutter/material.dart';

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
      child: Text(
        "Bienvenido!",
        style: TextStyle(
          color: Colors.white70,
          fontSize: 18.0,
        ),
      ),
    ));
  }
}
