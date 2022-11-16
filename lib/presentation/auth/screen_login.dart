import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/application/auth/auth_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/auth/screen_forgot_password.dart';
import 'package:razer/presentation/main__page/main_page.dart';
import 'package:razer/presentation/auth/auth_page.dart';
import 'package:razer/presentation/auth/screen_signUp.dart';
import 'package:razer/presentation/auth/widgets/buttons.dart';
import 'package:razer/presentation/utils/utils.dart';

class LoginWidget extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  LoginWidget({
    // required this.onClickLogin,
    Key? key,
  }) : super(key: key);
  final email = TextEditingController();
  final password = TextEditingController();
  // final VoidCallback onClickLogin;
  bool _validate = false;
  final formKey = GlobalKey<FormState>();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Row(),
              height_20,
              height_20,
              height_20,
              height_20,
              const CircleAvatar(
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
                children: const [
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
                    child: TextFormField(
                      controller: email,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (email) =>
                      //     email != null && !EmailValidator.validate(email)
                      //         ? 'Enter a valid email'
                      //         : null,
                      decoration: InputDecoration(
                          errorText: _validate ? 'W rong Email' : null,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: razergreen, width: 1.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: justgreen, width: 1.0),
                          ),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.white70)),
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
                    child: TextFormField(
                      controller: password,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (password) =>
                      //     password != null && password.length >= 8
                      //         ? 'password is too short (min 8)'
                      //         : null,
                      decoration: InputDecoration(
                          errorText: _validate ? 'wrong password' : null,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: razergreen, width: 1.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: justgreen, width: 1.0),
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.white70)),
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
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScreenForgotPassword(),
                      ),
                    ),
                    child: const Text(
                      'forgot password',
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
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
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: justgreen),
                      onPressed: () {
                        final isValid = formKey.currentState!.validate();
                        if (!isValid) return;
                        BlocProvider.of<AuthBloc>(context).add(Login(
                            email: email.text.trim(),
                            password: password.text.trim(),
                            context: context));
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.lock,
                            size: 26,
                          ),
                          const Text('  Login  '),
                        ],
                      )),
                ],
              ),
              height_20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () =>
                        BlocProvider.of<AuthBloc>(context).add(Toggle()),
                    child: RichText(
                      text: const TextSpan(
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {
                          //     return BlocProvider.of<AuthBloc>(context).add(Toggle());
                          //
                          //   },
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                          text: 'No account ?',
                          children: [
                            TextSpan(
                              style:
                                  TextStyle(color: Colors.green, fontSize: 18),
                              text: '  Sign UP',
                            ),
                          ]),
                    ),
                  )
                ],
              ),
              height_20,
              height_20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
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
                  // CircleAvatar(
                  //   radius: 22,
                  //   backgroundColor: Colors.transparent,
                  //   child: CircleAvatar(
                  //     radius: 22,
                  //     backgroundImage: NetworkImage(
                  //         'https://www.edigitalagency.com.au/wp-content/uploads/Facebook-logo-blue-circle-large-transparent-png.png'),
                  //     backgroundColor: Colors.transparent,
                  //   ),
                  // ),
                  // CircleAvatar(
                  //   radius: 25,
                  //   backgroundColor: Colors.transparent,
                  //   child: CircleAvatar(
                  //     radius: 25,
                  //     backgroundImage: NetworkImage(
                  //         'https://www.freepnglogos.com/uploads/twitter-logo-png/twitter-logo-vector-png-clipart-1.png'),
                  //     backgroundColor: Colors.transparent,
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
