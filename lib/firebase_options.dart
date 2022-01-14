// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAcQMw391p3mVGetCzWhGpJFKnIq8C_FXI',
    appId: '1:647109092802:web:b0f8d0dccf63730097e25b',
    messagingSenderId: '647109092802',
    projectId: 'fruits-app-d0c41',
    authDomain: 'fruits-app-d0c41.firebaseapp.com',
    storageBucket: 'fruits-app-d0c41.appspot.com',
    measurementId: 'G-H3FDHCX58X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtz5VX3Ou-Rmaf-xRF5trvpb-9fUQYbNo',
    appId: '1:647109092802:android:8df5dde5aae1a48797e25b',
    messagingSenderId: '647109092802',
    projectId: 'fruits-app-d0c41',
    storageBucket: 'fruits-app-d0c41.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7HtMKRx471ZoTRbCjup_2QlTJyTATUvc',
    appId: '1:647109092802:ios:295c1bde65da10d797e25b',
    messagingSenderId: '647109092802',
    projectId: 'fruits-app-d0c41',
    storageBucket: 'fruits-app-d0c41.appspot.com',
    iosClientId: '647109092802-h07rctb1pd5t4rbon8eqt55qs52rs87g.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );
}
