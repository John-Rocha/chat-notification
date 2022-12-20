import 'package:chat_notification/core/models/chat_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class ChatNotificationService with ChangeNotifier {
  final List<ChatNotification> _items = [];

  int get itemsCount => _items.length;

  List<ChatNotification> get items => [..._items];

  void add(ChatNotification notification) {
    _items.add(notification);
    notifyListeners();
  }

  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  // Push Notification

  Future<void> init() async {
    await _configureForeground();
  }

  Future<bool> get _isAuthorized async {
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  Future<void> _configureForeground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessage.listen((msg) {
        if (msg.notification == null) return;
        add(ChatNotification(
          title: msg.notification!.title ?? 'Não informado',
          body: msg.notification!.body ?? 'Não informado',
        ));
      });
    }
  }
}
