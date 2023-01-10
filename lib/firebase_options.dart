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
        return ios;
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
    apiKey: 'AIzaSyA3sIjxGVDBOB8NZI5TnIXZWKh9BqFsgQE',
    appId: '1:1065650590559:web:caddf19a87d7b497fcdcea',
    messagingSenderId: '1065650590559',
    projectId: 'fir-assignment-2-ca771',
    authDomain: 'fir-assignment-2-ca771.firebaseapp.com',
    storageBucket: 'fir-assignment-2-ca771.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEizc78f5RlT6d8QLHY0v0KhdNxDdeRRg',
    appId: '1:1065650590559:android:e3ae015a4b52fc5efcdcea',
    messagingSenderId: '1065650590559',
    projectId: 'fir-assignment-2-ca771',
    storageBucket: 'fir-assignment-2-ca771.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSzjP-idb_FS-mYpw0AIbuSoVGr5X9vjE',
    appId: '1:1065650590559:ios:79e7029429c39865fcdcea',
    messagingSenderId: '1065650590559',
    projectId: 'fir-assignment-2-ca771',
    storageBucket: 'fir-assignment-2-ca771.appspot.com',
    iosClientId: '1065650590559-f75k0v107ua2kbid738r7cl6ojlcmvfp.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAssignment2',
  );
}
