import 'package:chat_notification/components/messages.dart';
import 'package:chat_notification/components/new_message.dart';
import 'package:chat_notification/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Chat'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 10),
                    Text('Sair')
                  ],
                ),
                onTap: () {
                  AuthService().logout();
                },
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Messages(),
          ),
          NewMessage(),
        ],
      )),
    );
  }
}
