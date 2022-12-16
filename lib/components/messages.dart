import 'package:chat_notification/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ChatService().messagesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Sem dados. Vamos conversar?'),
          );
        } else {
          final messages = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (_, index) {
              return Text(messages[index].text);
            },
          );
        }
      },
    );
  }
}
