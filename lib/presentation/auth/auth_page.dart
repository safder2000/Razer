import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/application/auth/auth_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/presentation/auth/screen_login.dart';
import 'package:razer/presentation/auth/screen_signUp.dart';
import 'package:razer/presentation/main__page/main_page.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: razergreen,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Somthing went wrong'),
            );
          } else if (snapshot.hasData) {
            return ScreenMainPage();
          } else {
            return AuthPage();
          }
        });
  }
}

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.isLogin
            // return isLogin
            ? LoginWidget()
            : SignUpWidget();
      },
    );
  }
}
