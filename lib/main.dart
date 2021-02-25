import 'package:flutter/material.dart';
import 'package:mi.municipio/User/bloc/login_state.dart';
import 'package:mi.municipio/User/ui/screens/home_page.dart';
import 'package:mi.municipio/User/ui/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      builder: (context) => LoginState(),
      child: MaterialApp(
        title: 'Mi Municipio',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) {
            var state = Provider.of<LoginState>(context);
            if (state.isLoggedIn()) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
