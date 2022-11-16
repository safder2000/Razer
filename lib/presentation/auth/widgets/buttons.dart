import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

RichText otherPage({
  required String text1,
  required String text2,
  required VoidCallback onClick,
}) {
  return RichText(
    text: TextSpan(
        recognizer: TapGestureRecognizer()..onTap = onClick,
        style: const TextStyle(
          color: Colors.white70,
        ),
        text: text1,
        children: [
          TextSpan(
            style: const TextStyle(color: Colors.green, fontSize: 18),
            text: text2,
          ),
        ]),
  );
}
