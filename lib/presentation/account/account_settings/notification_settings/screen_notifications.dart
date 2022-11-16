import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Notification Settings',
          style: TextStyle(color: justgreen),
        ),
      ),
      body: Column(
        children: [
          greenDiv,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Switches(
                title: 'Notification A',
              ),
              grayDiv,
              Switches(
                title: 'Notification B',
              ),
              grayDiv,
              Switches(
                title: 'Notification C',
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class Switches extends StatelessWidget {
  Switches({
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        Spacer(),
        CupertinoSwitch(
          trackColor: Colors.white38,
          onChanged: (value) {},
          value: false,
        )
      ],
    );
  }
}
