import 'package:flutter/material.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/main__page/main_page.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool _validate = false;
  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(),
            height_20,
            height_20,
            height_20,
            height_20,
            CircleAvatar(
              radius: 90,
              backgroundColor: razergreen,
              child: CircleAvatar(
                radius: 89,
                child: CircleAvatar(
                  radius: 88,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/564x/31/ea/9a/31ea9a0324756719da71f39be82f22bf.jpg'),
                ),
              ),
            ),
            height_10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Makima',
                  style: TextStyle(fontSize: 23),
                ),
              ],
            ),
            height_20,
            height_20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: username,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    decoration: new InputDecoration(
                        errorText: _validate ? 'wrong username' : null,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: razergreen, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: justgreen, width: 1.0),
                        ),
                        hintText: 'User Name',
                        hintStyle: TextStyle(color: Colors.white70)),
                  ),
                ),
              ],
            ),
            height_20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: password,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    decoration: new InputDecoration(
                        errorText: _validate ? 'wrong password' : null,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: razergreen, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: justgreen, width: 1.0),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white70)),
                  ),
                ),
              ],
            ),
            height_10,
            Row(
              children: [
                width_20,
                width_20,
                width_10,
                width_5,
                Text(
                  'forget password',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                )
              ],
            ),
            height_20,
            height_20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        textStyle: TextStyle(fontSize: 20),
                        backgroundColor: justgreen),
                    onPressed: () {
                      setState(() {
                        if (password.text.isEmpty ||
                            username.text.isEmpty ||
                            username.text != 'makima' ||
                            password.text != 'makima') {
                          _validate = true;
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  ScreenMainPage(),
                            ),
                          );
                          _validate = false;
                        }
                      });
                    },
                    child: Text('   Login   ')),
              ],
            ),
            height_20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SignUp',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              ],
            ),
            height_20,
            height_20,
            height_20,
            height_20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                        'https://assets.stickpng.com/images/5847f9cbcef1014c0b5e48c8.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                        'https://www.edigitalagency.com.au/wp-content/uploads/Facebook-logo-blue-circle-large-transparent-png.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://www.freepnglogos.com/uploads/twitter-logo-png/twitter-logo-vector-png-clipart-1.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
