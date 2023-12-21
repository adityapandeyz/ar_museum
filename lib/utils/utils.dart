import 'package:flutter/material.dart';

const backgroundColor = Color.fromARGB(255, 0, 0, 0);
const primaryColor = Color.fromARGB(94, 68, 137, 255);
const secondaryColor = Color.fromARGB(33, 158, 158, 158);
const lightGreyText = Color.fromARGB(255, 39, 39, 39);

showAlert(BuildContext context, text) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Alert!!!"),
        content: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            child: const Text(
              "OK",
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
