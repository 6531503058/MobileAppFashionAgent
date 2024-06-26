// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDKhrj40ZKBGAr4sorZNc2cnbyaFDrMzKU',
    appId: '1:662087737964:web:3be1771c4e4d58fb066e49',
    messagingSenderId: '662087737964',
    projectId: 'fashionagent-ff669',
    authDomain: 'fashionagent-ff669.firebaseapp.com',
    databaseURL: 'https://fashionagent-ff669-default-rtdb.firebaseio.com',
    storageBucket: 'fashionagent-ff669.appspot.com',
    measurementId: 'G-F5KVYNHL1E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAZbgLqUnP9JwKGIgFD8WaQGlt9aZl4jw',
    appId: '1:662087737964:android:509d8be51bc5ea7f066e49',
    messagingSenderId: '662087737964',
    projectId: 'fashionagent-ff669',
    databaseURL: 'https://fashionagent-ff669-default-rtdb.firebaseio.com',
    storageBucket: 'fashionagent-ff669.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmBwkTqFf-hLNK5X-oIRxO_yzB_exU3kg',
    appId: '1:662087737964:ios:bbd483367da5c7d8066e49',
    messagingSenderId: '662087737964',
    projectId: 'fashionagent-ff669',
    databaseURL: 'https://fashionagent-ff669-default-rtdb.firebaseio.com',
    storageBucket: 'fashionagent-ff669.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmBwkTqFf-hLNK5X-oIRxO_yzB_exU3kg',
    appId: '1:662087737964:ios:bbd483367da5c7d8066e49',
    messagingSenderId: '662087737964',
    projectId: 'fashionagent-ff669',
    databaseURL: 'https://fashionagent-ff669-default-rtdb.firebaseio.com',
    storageBucket: 'fashionagent-ff669.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDKhrj40ZKBGAr4sorZNc2cnbyaFDrMzKU',
    appId: '1:662087737964:web:ecbab9253fa5a92f066e49',
    messagingSenderId: '662087737964',
    projectId: 'fashionagent-ff669',
    authDomain: 'fashionagent-ff669.firebaseapp.com',
    databaseURL: 'https://fashionagent-ff669-default-rtdb.firebaseio.com',
    storageBucket: 'fashionagent-ff669.appspot.com',
    measurementId: 'G-918YL80DV3',
  );

}