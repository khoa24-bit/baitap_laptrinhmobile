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
    apiKey: 'AIzaSyCvx2aHqYAcnTpMZJyoQoAatmK3W3cyfO8',
    appId: '1:133680605092:web:497db1ddbba4b6dd878331',
    messagingSenderId: '133680605092',
    projectId: 'baitaplaptrinhmobile',
    authDomain: 'baitaplaptrinhmobile.firebaseapp.com',
    storageBucket: 'baitaplaptrinhmobile.firebasestorage.app',
    measurementId: 'G-F2CCEC7P0D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0RsETMoBcyr9TQ3nLkFrdyX9oKUZ_Nec',
    appId: '1:133680605092:android:31e8094b589a730c878331',
    messagingSenderId: '133680605092',
    projectId: 'baitaplaptrinhmobile',
    storageBucket: 'baitaplaptrinhmobile.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkhdvFx8sFwDuIV9ckKuIJTO2lGmIAkgg',
    appId: '1:133680605092:ios:69d54d1d854922c3878331',
    messagingSenderId: '133680605092',
    projectId: 'baitaplaptrinhmobile',
    storageBucket: 'baitaplaptrinhmobile.firebasestorage.app',
    iosClientId: '133680605092-3trmbccpobkbrgaikkpet7urgq0ednan.apps.googleusercontent.com',
    iosBundleId: 'com.example.ageChecker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkhdvFx8sFwDuIV9ckKuIJTO2lGmIAkgg',
    appId: '1:133680605092:ios:69d54d1d854922c3878331',
    messagingSenderId: '133680605092',
    projectId: 'baitaplaptrinhmobile',
    storageBucket: 'baitaplaptrinhmobile.firebasestorage.app',
    iosClientId: '133680605092-3trmbccpobkbrgaikkpet7urgq0ednan.apps.googleusercontent.com',
    iosBundleId: 'com.example.ageChecker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCvx2aHqYAcnTpMZJyoQoAatmK3W3cyfO8',
    appId: '1:133680605092:web:d41b3b78355a6a39878331',
    messagingSenderId: '133680605092',
    projectId: 'baitaplaptrinhmobile',
    authDomain: 'baitaplaptrinhmobile.firebaseapp.com',
    storageBucket: 'baitaplaptrinhmobile.firebasestorage.app',
    measurementId: 'G-JGZNC8Z0MF',
  );
}
