import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/application/auth/auth_bloc.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/utils/utils.dart';

class ScreenForgotPassword extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  ScreenForgotPassword({
    // required this.onClickLogin,
    Key? key,
  }) : super(key: key);
  final email = TextEditingController();
  final password = TextEditingController();
  // final VoidCallback onClickLogin;
  bool _validate = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Row(),
            height_20,
            height_20,
            height_20,
            height_20,
            height_10,
            height_20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text('Enter your email'),
            ),
            height_20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
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
                          borderSide: BorderSide(color: razergreen, width: 1.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: justgreen, width: 1.0),
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
              children: [],
            ),
            height_10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(
                            MediaQuery.of(context).size.width * 0.9,
                            MediaQuery.of(context).size.width * 0.2),
                        elevation: 0,
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: justgreen),
                    onPressed: () {
                      resetPassword(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail,
                          size: 26,
                        ),
                        const Text('  Reset Password  '),
                      ],
                    )),
              ],
            ),
            height_20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => BlocProvider.of<AuthBloc>(context).add(Toggle()),
                  child: RichText(
                    text: TextSpan(
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () {
                        //     return BlocProvider.of<AuthBloc>(context)
                        //         .add(Toggle());
                        //   },
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                        text: 'No account ?',
                        children: [
                          TextSpan(
                            style: const TextStyle(
                                color: Colors.green, fontSize: 18),
                            text: '  Sign UP',
                          ),
                        ]),
                  ),
                )
              ],
            ),
            height_20,
            height_20,
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
    );
  }

  Future resetPassword(context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.text.trim(),
      );
      Utils.showSnackBar(text: 'Password reset email send', color: justgreen);
    } on FirebaseAuthException catch (e) {
      print(">>>>>>>> Exception caught $e");
      Utils.showSnackBar(text: e.message);
    }
    // navigatorKey.currentState!.pop((route) => route);
    Navigator.pop(context);
  }
}
