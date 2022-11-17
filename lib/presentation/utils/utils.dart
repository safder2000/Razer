import 'package:flutter/material.dart';

class Utils {
  final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(
      {String? text, Color color = Colors.red, required context}) {
    if (text == null) return;
    final snackBar = SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // messengerKey.currentState!
    //   ..removeCurrentSnackBar()
    //   ..showSnackBar(snackBar);
  }
}
