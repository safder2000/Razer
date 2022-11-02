import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class AccountSettingsWidgets extends StatelessWidget {
  AccountSettingsWidgets({
    required this.ico,
    required this.title,
    Key? key,
  }) : super(key: key);
  IconData ico;
  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              ico,
              color: razergreen,
              size: 30,
            ),
            width_5,
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: razergreen,
              size: 24,
            ),
            width_10
          ],
        ),
        const Divider(
          color: Colors.white24,
          height: 20,
        )
      ],
    );
  }
}
