// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCOUMwFpWy4e5vbOuEvg2HTKHDSs-d90_M',
    appId: '1:342647219806:web:0e653984df3ed436d336cf',
    messagingSenderId: '342647219806',
    projectId: 'chat-b3512',
    authDomain: 'chat-b3512.firebaseapp.com',
    storageBucket: 'chat-b3512.appspot.com',
    measurementId: 'G-RFX05G5ZZN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbv4rGiKPj_1OjSprcQCA_GpeYSVA7pjg',
    appId: '1:342647219806:android:15fb7705947126e4d336cf',
    messagingSenderId: '342647219806',
    projectId: 'chat-b3512',
    storageBucket: 'chat-b3512.appspot.com',
  );
}
