//////////////////////////////////////////////////////////////////////////
/// this is the correct pattern propose from Google to set the observables
/// vars as globals and manage yours trigger on change
//////////////////////////////////////////////////////////////////////////
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

enum LoginProvider { FACEBOOK, TWITTER, GOOGLE }

class LoginState with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin facebookLogin = FacebookLogin();
  User _user;
  bool _loggedin = false;
  bool isLoggedIn() => _loggedin;
  var user;
  void login(LoginProvider loginProvider) async {
    switch (loginProvider) {
      case LoginProvider.GOOGLE:
        user = await signInWithGoogle();
        break;
      case LoginProvider.FACEBOOK:
        user = await signInWithFacebook();
        break;
      case LoginProvider.TWITTER:
        user = await signInWithFacebook();
        break;
    }
  }

  void logout() {
    _loggedin = false;
    notifyListeners();
  }

  Future<String> signInWithGoogle() async {
    await Firebase.initializeApp();
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      _loggedin = true;
      notifyListeners();
      //print('Ingreso: $user');
      return '$user';
    }
    return null;
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    _loggedin = false;
    notifyListeners();
    print('salio');
  }

  //Login in with facebook

  Future<String> signInWithFacebook() async {
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
      case FacebookLoginStatus.loggedIn:
        try {
          await loginWithfacebook(result);
        } catch (e) {
          print(e);
        }
        break;
    }
  }

  Future loginWithfacebook(FacebookLoginResult result) async {
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    var a = await _auth.signInWithCredential(credential);
    _loggedin = true;
    notifyListeners();
    _user = a.user;
    return _user;
  }

  Future<void> logUtFacebook() async {
    await _auth.signOut().then((onValue) {
      facebookLogin.logOut();
      _loggedin = false;
      print('entro al false');
    });
  }
}

/* 
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
*/
