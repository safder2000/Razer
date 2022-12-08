import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class NotificationTileWidget extends StatelessWidget {
  NotificationTileWidget({
    this.isOpened = true,
    required this.title,
    required this.time,
    required this.sub,
    Key? key,
  }) : super(key: key);
  bool isOpened;
  String title;
  String time;
  String sub;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white12,
            border: Border.all(
                color:
                    isOpened ? justgreen : Color.fromARGB(0, 255, 255, 255))),
        child: Column(
          children: [
            height_10,
            Row(
              children: [
                width_5,
                isOpened
                    ? const Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.white54,
                      )
                    : const Icon(
                        Icons.check_box,
                        color: justgreen,
                      ),
                width_10,
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight:
                          isOpened ? FontWeight.bold : FontWeight.normal,
                      color: isOpened ? Colors.white : Colors.white60),
                ),
              ],
            ),
            height_5,
            Text(
              sub,
              style: TextStyle(
                  fontSize: 13,
                  color: isOpened ? Colors.white70 : Colors.white54),
            ),
            height_10,
            Row(
              children: [
                Spacer(),
                // Text(
                //   time,
                //   style: TextStyle(fontSize: 11, color: Colors.white54),
                // ),
                // width_10
              ],
            ),
          ],
        ),
      ),
    );
  }
}
