import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:razer/application/auth/auth_bloc.dart';
import 'package:razer/presentation/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserAuth {
  static Future signUp(
      {required context, required password, required email}) async {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );

    // log('$email === $password ');
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(">>>>>>>> Exception caught $e");
      // Utils.showSnackBar(text: e.message);
    }

    // Navigator.pop(context);
    // navigatorKey.currentState!.pop((route) => route);
  }

  static Future login(
      {required context, required password, required email}) async {
    UserCredential user;

    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
      // user.credential;
    } on FirebaseAuthException catch (e) {
      print(">>>>>>>> Exception caught $e");
      Utils.showSnackBar(text: e.message, context: context);
    }
    // navigatorKey.currentState!.pop((route) => route);

    Navigator.pop(context);
  }

  static Future addUser() async {
    final email = FirebaseAuth.instance.currentUser!.email;
    log("${email}");

    final docUser = FirebaseFirestore.instance.collection('users').doc(email);
    List<String> cart = [];
    Map<String, dynamic> map = {
      'email': email,
    };
    await docUser.set(map);
    log('new user created n added to databse');
  }
}
