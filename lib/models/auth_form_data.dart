import 'dart:io';

enum AuthMode { signup, login }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;
  AuthMode? _authMode = AuthMode.login;

  bool get isLogin => _authMode == AuthMode.login;

  bool get isSignup => _authMode == AuthMode.signup;

  void toggleAuthMode() {
    _authMode = isLogin ? AuthMode.signup : AuthMode.login;
  }
}
