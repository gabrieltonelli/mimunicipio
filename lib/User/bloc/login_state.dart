//////////////////////////////////////////////////////////////////////////
/// this is the correct pattern propose from Google to set the observables
/// vars as globals and manage yours trigger on change
//////////////////////////////////////////////////////////////////////////
import "package:flutter/material.dart";

class LoginState with ChangeNotifier {
  bool _loggedIn = false;

  void login() {
    _loggedIn = true;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
  }
}
