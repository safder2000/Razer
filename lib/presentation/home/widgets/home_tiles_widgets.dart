import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class HomeTilesWidgets extends StatelessWidget {
  const HomeTilesWidgets({
    required this.title,
    required this.sub,
    required this.cover,
    Key? key,
  }) : super(key: key);
  final String title;
  final String sub;
  final String cover;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height_10,
        height_10,
        height_10,
        Text(
          title,
          style: const TextStyle(
              fontSize: 23, fontWeight: FontWeight.w900, letterSpacing: 3),
          textAlign: TextAlign.center,
        ),
        height_10,
        Text(
          sub,
          style: TextStyle(fontSize: 13, color: Colors.white70),
        ),
        height_10,
        Container(
          height: 280,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(cover), fit: BoxFit.cover),
          ),
        ),
        const Divider(
          color: razergreen,
          thickness: 1,
          height: 0,
        ),
      ],
    );
  }
}
