import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class AccountBoxesWidget extends StatelessWidget {
  AccountBoxesWidget({
    required this.ico,
    required this.title,
    Key? key,
  }) : super(key: key);
  IconData ico;
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        width_10,
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(56, 255, 255, 255),
              borderRadius: BorderRadius.circular(10)),
          height: 41,
          width: 180,
          child: Row(
            children: [
              width_5,
              Icon(
                ico,
                color: razergreen,
              ),
              width_5,
              Text(title),
            ],
          ),
        ),
      ],
    );
  }
}
