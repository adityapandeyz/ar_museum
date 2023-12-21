import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleSignInProvider with ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = userCredential.user;
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  // Future<void> checkCurrentUser() async {
  //   User? currentUser = _auth.currentUser;

  //   if (currentUser != null) {
  //     _user = currentUser;
  //     notifyListeners();
  //   }
  // }

  // Future<void> signOut() async {
  //   await _auth.signOut();

  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove('google_id_token');
  //   prefs.remove('google_access_token');

  //   _user = null;
  //   notifyListeners();
  // }
}
