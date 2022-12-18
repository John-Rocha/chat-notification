import 'package:chat_notification/components/messages.dart';
import 'package:chat_notification/components/new_message.dart';
import 'package:chat_notification/core/services/auth/auth_service.dart';
import 'package:chat_notification/core/services/notification/chat_notification_service.dart';
import 'package:chat_notification/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    ),
                  );
                },
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  maxRadius: 10,
                  backgroundColor: Colors.red.shade800,
                  child: Text(
                    '${Provider.of<ChatNotificationService>(context).itemsCount}',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: const [
          Expanded(
            child: Messages(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: NewMessage(),
          ),
        ],
      )),
    );
  }
}
