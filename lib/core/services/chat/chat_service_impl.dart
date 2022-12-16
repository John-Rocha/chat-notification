import 'dart:async';
import 'dart:math';

import 'package:chat_notification/core/models/chat_user.dart';

import 'package:chat_notification/core/models/chat_message.dart';

import './chat_service.dart';

class ChatServiceImpl implements ChatService {
  static final List<ChatMessage> _messages = [];

  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _messagesStream = Stream<List<ChatMessage>>.multi(
    (controller) {
      _controller = controller;
      controller.add(_messages);
    },
  );

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _messagesStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextInt(1000).toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageURL,
    );
    _messages.add(newMessage);
    _controller?.add(_messages.reversed.toList());
    return newMessage;
  }
}
