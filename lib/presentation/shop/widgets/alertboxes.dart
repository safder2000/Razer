import 'package:flutter/material.dart';

showAlertBox({
  required BuildContext context,
  required Widget button1,
  required Widget button2,
  required String content,
}) {
  // set up the button

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Color.fromARGB(255, 46, 46, 46),
    content: Text(
      content,
      style: TextStyle(fontSize: 20, color: Colors.white),
    ),
    actions: [
      button1,
      button2,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
