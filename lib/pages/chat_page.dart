import 'package:chat_notification/core/services/auth/auth_service_impl.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chat Page'),
            TextButton(
              onPressed: () => AuthServiceImpl().logout(),
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
