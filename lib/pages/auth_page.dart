import 'package:chat_notification/components/auth_form.dart';
import 'package:chat_notification/core/models/auth_form_data.dart';
import 'package:chat_notification/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData authFormData) async {
    try {
      setState(() => _isLoading = true);
      if (authFormData.isLogin) {
        // Login
        await AuthService().login(
          authFormData.email,
          authFormData.password,
        );
      } else {
        // Signup
        await AuthService().signup(
          authFormData.name,
          authFormData.email,
          authFormData.password,
          authFormData.image,
        );
      }
    } catch (e) {
      // Tratar erro
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(
                onSubmit: _handleSubmit,
              ),
            ),
          ),
          _isLoading
              ? Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
