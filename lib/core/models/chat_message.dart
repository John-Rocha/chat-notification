import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  final String id;
  final String text;
  final DateTime createdAt;

  // User Information
  final String userId;
  final String userName;
  final String userImageUrl;

  ChatMessage({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.userId,
    required this.userName,
    required this.userImageUrl,
  });
}
