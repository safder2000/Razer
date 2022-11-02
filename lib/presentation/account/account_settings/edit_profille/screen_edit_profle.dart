import 'package:flutter/material.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: justgreen),
        ),
      ),
      body: ListView(children: [
        height_20,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: const [
                CircleAvatar(
                  radius: 71,
                  backgroundColor: Colors.white60,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      'https://staticg.sportskeeda.com/editor/2022/10/77c8d-16660870279554-1920.jpg',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.edit),
                  ),
                )
              ],
            ),
          ],
        ),
        height_20,
        height_20,
        textfield('First Name'),
        height_20,
        textfield('Last Name'),
        height_20,
        textfield('Mobile Number'),
        height_20,
        textfield('Email ID'),
        height_20,
        height_20,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.white24),
              child: const Text('  Save  '),
            ),
          ],
        )
      ]),
    );
  }

  Row textfield(String hint) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          child: TextField(
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
                // errorText: _validate ? 'wrong password' : null,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: razergreen, width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white60, width: 1.0),
                ),
                label: Text(
                  hint,
                  style: const TextStyle(color: Colors.white70),
                ),
                hintStyle: const TextStyle(color: Colors.white70)),
          ),
        ),
      ],
    );
  }
}
