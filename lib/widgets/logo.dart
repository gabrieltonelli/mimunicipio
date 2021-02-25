import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ///////////////logo image
      Container(
        padding: EdgeInsets.only(top: 100.0),
        child: Center(
          child: Image(
            image: AssetImage('assets/images/logo-white.png'),
            width: 80.0,
            height: 80.0,
          ),
        ),
      ),
      ///////////////logo text
      Container(
        padding: EdgeInsets.only(top: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Mi Municipio",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )
    ]);
  }
}
