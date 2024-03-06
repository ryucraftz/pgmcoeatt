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
        return macos;
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
    apiKey: 'AIzaSyD-8ivHeSUXXveOA7_k9qNN_uBsalBrG_c',
    appId: '1:346394510244:web:ed513db274e0e5202ff731',
    messagingSenderId: '346394510244',
    projectId: 'pgmcoeatt',
    authDomain: 'pgmcoeatt.firebaseapp.com',
    storageBucket: 'pgmcoeatt.appspot.com',
    measurementId: 'G-QVNTX8LN3K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3rM6lEdhogOuJSn7GSWC5R7g6VqdHMa4',
    appId: '1:346394510244:android:b5e04d137d87fb2f2ff731',
    messagingSenderId: '346394510244',
    projectId: 'pgmcoeatt',
    storageBucket: 'pgmcoeatt.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWNICMXMP5PLGofwjyjeqnNvc7xCwrlE8',
    appId: '1:346394510244:ios:714cf150ef5900b52ff731',
    messagingSenderId: '346394510244',
    projectId: 'pgmcoeatt',
    storageBucket: 'pgmcoeatt.appspot.com',
    iosBundleId: 'com.example.pgmcoeAtt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWNICMXMP5PLGofwjyjeqnNvc7xCwrlE8',
    appId: '1:346394510244:ios:450263a213e7b5472ff731',
    messagingSenderId: '346394510244',
    projectId: 'pgmcoeatt',
    storageBucket: 'pgmcoeatt.appspot.com',
    iosBundleId: 'com.example.pgmcoeAtt.RunnerTests',
  );
}
