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
    apiKey: 'AIzaSyBnqzmAebjGgs-LoE5J3a3X5TzWof2-CMg',
    appId: '1:34306637613:web:ba748ddefe527e7090dda4',
    messagingSenderId: '34306637613',
    projectId: 'case-study-fb429',
    authDomain: 'case-study-fb429.firebaseapp.com',
    storageBucket: 'case-study-fb429.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBv9qet4shNYdoeXFd_9w84jI2ZJWcUoeE',
    appId: '1:34306637613:android:c3d6ca65391151fa90dda4',
    messagingSenderId: '34306637613',
    projectId: 'case-study-fb429',
    storageBucket: 'case-study-fb429.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCVJ4h9wn2j_cRM7MZXNfJscwuOJgqVApk',
    appId: '1:34306637613:ios:f9f6b4cb83a5b8f390dda4',
    messagingSenderId: '34306637613',
    projectId: 'case-study-fb429',
    storageBucket: 'case-study-fb429.appspot.com',
    iosBundleId: 'com.example.caseStudy.RunnerTests',
  );
}
