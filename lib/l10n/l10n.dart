import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('hi'),
    const Locale('ml'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'hi':
        return 'HINDI';
      case 'en':
        return 'ENGLISH';
      case 'ml':
        return 'MALAYALAM';
      default:
        return 'ENGLISH';
    }
  }
}
