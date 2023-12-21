import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

class FireProvider extends ChangeNotifier {
  Future uploadData(
    String personName,
    String personNum,
    String title,
    String message,
    DateTime date,
    context,
  ) async {
    var docId = const Uuid().v4();

    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(docId)
          .set(
        {
          'PersonName': personName,
          'PersonNum': personNum,
          'title': title,
          'message': message,
          'date': date,
          'createdAt': DateTime.now(),
          'docId': docId,
        },
      );
    } catch (e) {
      // showAlert(context, e.toString());
      // notifyListeners();
      // return;
    }

    // showAlert(context, 'Appointment created.');
    notifyListeners();
  }

  Future deleteData(String dataDocId) async {
    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(dataDocId)
          .delete();
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
