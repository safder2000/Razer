part of 'auth_bloc.dart';

@immutable
class AuthState {
  AuthState({
    required this.isLogin,
    // this.user
  });
  bool isLogin;
  // UserCredential? user;
}

class InitialState extends AuthState {
  InitialState() : super(isLogin: true);
}
