import 'package:chat_notification/core/models/chat_user.dart';

import 'dart:io';

import './auth_service.dart';

class AuthServiceImpl implements AuthService {
  @override
  ChatUser? get currentUser => null;

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
