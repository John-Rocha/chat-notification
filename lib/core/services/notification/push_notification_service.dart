import 'package:chat_notification/core/models/chat_notification.dart';
import 'package:flutter/cupertino.dart';

class PushNotificationService with ChangeNotifier {
  final List<ChatNotification> _items = [];

  List<ChatNotification> get items => [..._items];

  void add(ChatNotification notification) {
    _items.add(notification);
    notifyListeners();
  }

  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
