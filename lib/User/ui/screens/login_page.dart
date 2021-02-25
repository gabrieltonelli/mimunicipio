import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi.municipio/widgets/logo.dart';
import 'package:mi.municipio/widgets/buttons.dart';

class LoginPage extends StatelessWidget {
  final Function onLoginSuccess;
  const LoginPage({Key key, this.onLoginSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _checkboxTerms = true;
    return Scaffold(
      body:
          ///////////////application background
          Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            ///////////////logo
            Logo(),
            //////////////social network buttons
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
              alignment: Alignment.center,
              child: Text(
                "Iniciá con tu red social favorita.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 60.0, right: 60.0, top: 10.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FloatingActionButton(
                      child: Icon(FontAwesomeIcons.google),
                      onPressed: () {
                        onLoginSuccess();
                      }),
                  FloatingActionButton(
                      child: Icon(FontAwesomeIcons.facebook), onPressed: () {}),
                  FloatingActionButton(
                      child: Icon(FontAwesomeIcons.twitter), onPressed: () {})
                ],
              ),
            ),
            ///////////////terms and conditions checkbox
            Container(
              width: MediaQuery.of(context).size.width,
              margin:
                  const EdgeInsets.only(left: 35.0, right: 20.0, top: 100.0),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Checkbox(
                      value: _checkboxTerms,
                      onChanged: (value) {
                        _checkboxTerms = !_checkboxTerms;
                      }),
                  Text(
                    'Al iniciar sesión en esta aplicación, \nacepto los términos y condiciones de uso.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            ///////////////terms and conditions button jump
            Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 0.0),
                alignment: Alignment.center,
                child: ButtonDownPriority(
                    "Ver términos y condicioines de uso", Colors.green, null)),
          ],
        ),
      ),
    );
  }
}
