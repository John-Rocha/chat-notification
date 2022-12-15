import 'package:chat_notification/core/models/chat_user.dart';
import 'package:chat_notification/core/services/auth/auth_service_impl.dart';
import 'package:chat_notification/pages/auth_page.dart';
import 'package:chat_notification/pages/chat_page.dart';
import 'package:chat_notification/pages/loading_page.dart';
import 'package:flutter/material.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthServiceImpl().userChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          } else {
            return snapshot.hasData ? ChatPage() : AuthPage();
          }
        },
      ),
    );
  }
}
