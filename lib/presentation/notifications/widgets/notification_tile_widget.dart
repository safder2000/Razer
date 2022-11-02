import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class NotificationTileWidget extends StatelessWidget {
  NotificationTileWidget({
    this.isOpened = true,
    required this.title,
    required this.sub,
    Key? key,
  }) : super(key: key);
  bool isOpened;
  String title;
  String sub;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.white12,
      child: Column(
        children: [
          height_10,
          Row(
            children: [
              width_5,
              isOpened
                  ? const Icon(
                      Icons.check_box,
                      color: justgreen,
                    )
                  : const Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.white54,
                    ),
              width_10,
              Text(
                title,
                style: TextStyle(
                    fontSize: 15,
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
              Text(
                '2 min ago',
                style: TextStyle(fontSize: 11, color: Colors.white54),
              ),
              width_10
            ],
          ),
        ],
      ),
    );
  }
}
