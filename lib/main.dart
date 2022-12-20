import 'package:chat_notification/core/services/auth/auth_firebase_service.dart';
import 'package:chat_notification/core/services/notification/chat_notification_service.dart';
import 'package:chat_notification/pages/auth_or_app_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatNotificationService(),
        ),
      ],
      child: MaterialApp(
        title: 'Chat Notification',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(129, 161, 175, 177),
            brightness: Brightness.dark,
          ),
        ),
        home: const AuthOrAppPage(),
      ),
    );
  }
}
