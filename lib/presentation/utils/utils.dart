import 'package:flutter/material.dart';

class Utils {
  final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar({String? text, Color color = Colors.red}) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    );
    // messengerKey.currentState!
    //   ..removeCurrentSnackBar()
    //   ..showSnackBar(snackBar);
  }
}