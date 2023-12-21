import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AdminAuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginAdmin(String email, String password, context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      showAlert(
        context,
        e.toString(),
      );
    }
    notifyListeners();
  }

  Future<void> logoutAdmin(context) async {
    try {
      await _auth.signOut();
    } catch (e) {
      showAlert(context, e.toString());
    }
    notifyListeners();
  }
}
