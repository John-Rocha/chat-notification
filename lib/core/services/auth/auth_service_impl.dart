import 'package:chat_notification/core/models/chat_user.dart';

import 'dart:io';

import './auth_service.dart';

class AuthServiceImpl implements AuthService {
  static Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Stream<ChatUser?> get userChanges => throw UnimplementedError();

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
    File image,
  ) async {}

  @override
  Future<void> login(
    String email,
    String password,
  ) async {}

  @override
  Future<void> logout() async {}
}
