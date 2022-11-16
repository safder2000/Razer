import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/application/auth/auth_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/auth/auth_page.dart';

import '../utils/utils.dart';

class SignUpWidget extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  SignUpWidget({
    // required this.onClickSignUp,
    Key? key,
  }) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  // final VoidCallback onClickSignUp;
  final password = TextEditingController();
  final password2 = TextEditingController();

  bool _validate = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Form(
              key: formKey,
              child: ListView(
                children: [
                  Row(),
                  height_20,
                  height_20,
                  height_20,
                  height_20,
                  // const CircleAvatar(
                  //   radius: 90,
                  //   backgroundColor: razergreen,
                  //   child: CircleAvatar(
                  //     radius: 89,
                  //     child: CircleAvatar(
                  //       radius: 88,
                  //       backgroundImage: NetworkImage(
                  //           'https://i.pinimg.com/564x/31/ea/9a/31ea9a0324756719da71f39be82f22bf.jpg'),
                  //     ),
                  //   ),
                  // ),
                  // height_10,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: const [
                  //     Text(
                  //       'Makima',
                  //       style: TextStyle(fontSize: 23),
                  //     ),
                  //   ],
                  // ),
                  height_20,
                  height_20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: username,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          // validator: (username) => username != null &&
                          //         !EmailValidator.validate(username)
                          //     ? 'Enter a valid email'
                          //     : null,
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: razergreen, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: justgreen, width: 1.0),
                              ),
                              hintText: 'Email',
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
                        child: TextFormField(
                          controller: password,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value != null && value.length <= 6
                                  ? 'password must be atleast 6 char long'
                                  : null,
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: razergreen, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: justgreen, width: 1.0),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white70)),
                        ),
                      ),
                    ],
                  ),
                  height_20,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SizedBox(
                  //       width: 300,
                  //       child: TextFormField(
                  //         controller: password2,
                  //         textAlign: TextAlign.center,
                  //         obscureText: true,
                  //         style: const TextStyle(
                  //             color: Colors.white, fontSize: 16),
                  //         autovalidateMode: AutovalidateMode.onUserInteraction,
                  //         validator: (value) => value != null &&
                  //                 value.length <= 8 &&
                  //                 password.text != password2.text
                  //             ? 'password didnt match'
                  //             : null,
                  //         decoration: const InputDecoration(
                  //             focusedBorder: OutlineInputBorder(
                  //               borderSide:
                  //                   BorderSide(color: razergreen, width: 1.0),
                  //             ),
                  //             enabledBorder: OutlineInputBorder(
                  //               borderSide:
                  //                   BorderSide(color: justgreen, width: 1.0),
                  //             ),
                  //             hintText: 'Confirm password',
                  //             hintStyle: TextStyle(color: Colors.white70)),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  height_10,
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
                            log('calling blco');

                            final isValid = formKey.currentState!.validate();
                            if (!isValid) {
                              log('invaied inputs');
                              return;
                            }
                            BlocProvider.of<AuthBloc>(context).add(AuthSignUp(
                                email: username.text.trim(),
                                password: password.text.trim(),
                                context: context));
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.arrow_forward_outlined,
                                size: 26,
                              ),
                              Text('  Sign Up  '),
                            ],
                          )),
                    ],
                  ),
                  height_20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    ScreenLogin(),
                              ),
                            );
                          },
                          child: GestureDetector(
                            onTap: () => BlocProvider.of<AuthBloc>(context)
                                .add(Toggle()),
                            child: RichText(
                              text: const TextSpan(
                                  // recognizer: TapGestureRecognizer()
                                  //   ..onTap = () {
                                  //     log('calling event');
                                  //     print('lllllllllllllllllllllll');

                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                  text: 'already have an account ?',
                                  children: [
                                    TextSpan(
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 18),
                                      text: '  Log in',
                                    ),
                                  ]),
                            ),
                          )),
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
            );
          },
        ),
      ),
    );
  }
}
