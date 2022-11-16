import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:razer/functions/user_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()) {
    on<AuthEvent>((event, emit) {});
    on<Toggle>((event, emit) {
      emit(AuthState(isLogin: !state.isLogin));
    });
    on<Login>((event, emit) async {
      final user = await UserAuth.login(
        context: event.context,
        password: event.password,
        email: event.email,
      );
    });
    on<AuthSignUp>((event, emit) async {
      await UserAuth.signUp(
        context: event.context,
        password: event.password,
        email: event.email,
      );
      log('1st half completed');
      await UserAuth.addUser();
      emit(state);
    });
  }
}
