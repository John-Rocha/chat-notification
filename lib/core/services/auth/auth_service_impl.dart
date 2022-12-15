import 'dart:async';
import 'dart:math';

import 'package:chat_notification/core/models/chat_user.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io';

import './auth_service.dart';

class AuthServiceImpl implements AuthService {
  static final _defaultChatUser = ChatUser(
    id: '1',
    name: 'John',
    email: 'johnathanrocha@gmail.com',
    password: '123456',
    imageURL: 'assets/images/avatar.png',
  );

  static final Map<String, ChatUser> _users = {
    _defaultChatUser.email: _defaultChatUser,
  };
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultChatUser);
  });

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Stream<ChatUser?> get userChanges => _userStream;

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final newUser = ChatUser(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      password: password,
      imageURL: image?.path ?? 'assets/images/avatar.png',
    );
    debugPrint(newUser.toString());
    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Future<void> login(
    String email,
    String password,
  ) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
