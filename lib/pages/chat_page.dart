import 'package:chat_notification/components/messages.dart';
import 'package:chat_notification/components/new_message.dart';
import 'package:chat_notification/core/models/chat_user.dart';
import 'package:chat_notification/core/services/auth/auth_service.dart';
import 'package:chat_notification/core/services/notification/chat_notification_service.dart';
import 'package:chat_notification/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  final ChatUser user;

  const ChatPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
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
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<ChatNotificationService>(context, listen: false).add(
      //       ChatNotification(title: 'Teste', body: 'Teste notificação'),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
