// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_production.dart';
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
    apiKey: 'AIzaSyCjSEzT1UpAyXgIRGF6FtBw1rq5bthRnuY',
    appId: '1:403378238471:web:5cf944850bfd36bdb126a2',
    messagingSenderId: '403378238471',
    projectId: 'athar-prod',
    authDomain: 'athar-prod.firebaseapp.com',
    storageBucket: 'athar-prod.firebasestorage.app',
    measurementId: 'G-PWN6V8KWNH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJrAP3WgYkGn27UJsCsbkUvHU-2HM5trs',
    appId: '1:403378238471:android:b561d0735d00b33cb126a2',
    messagingSenderId: '403378238471',
    projectId: 'athar-prod',
    storageBucket: 'athar-prod.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACPHJq-KRdO3CF8ieM36-CrMWJp2ODfXg',
    appId: '1:403378238471:ios:a49340f60c691129b126a2',
    messagingSenderId: '403378238471',
    projectId: 'athar-prod',
    storageBucket: 'athar-prod.firebasestorage.app',
    iosBundleId: 'com.example.verygoodcore.athar',
  );

}