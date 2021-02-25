import 'package:flutter/material.dart';
import 'package:mi.municipio/User/ui/screens/login_page.dart';
import 'package:mi.municipio/User/ui/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _loguedIn = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mi Municipio',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          ////////////////conditional screen if user is logued or not
          '/': (BuildContext contex) {
            if (_loguedIn) {
              return HomePage();
            } else {
              return LoginPage(
                onLoginSuccess: () {
                  setState(() {
                    _loguedIn = true;
                  });
                },
              );
            }
          },
        });
  }
}
