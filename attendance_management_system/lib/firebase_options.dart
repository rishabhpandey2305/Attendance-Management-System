import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAWk7a7k13-MMEUNZ_2vZEbV8dS6DwbCL4',
    appId: '1:953009996983:web:58b7c0291d6f3f30aeb932',
    messagingSenderId: '953009996983',
    projectId: 'attendance-management-sy-3d1cc',
    authDomain: 'attendance-management-sy-3d1cc.firebaseapp.com',
    storageBucket: 'attendance-management-sy-3d1cc.appspot.com',
    measurementId: 'G-2W57KN1HJ7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDu1x_09nEtAWmyB5mb2GgyUEtu-i9KXtg',
    appId: '1:953009996983:android:6941151b0379d670aeb932',
    messagingSenderId: '953009996983',
    projectId: 'attendance-management-sy-3d1cc',
    storageBucket: 'attendance-management-sy-3d1cc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAn5jbD6YS_KEfrqSA-GPGHIyuVLCQAwyo',
    appId: '1:953009996983:ios:b5260d3385384778aeb932',
    messagingSenderId: '953009996983',
    projectId: 'attendance-management-sy-3d1cc',
    storageBucket: 'attendance-management-sy-3d1cc.appspot.com',
    iosBundleId: 'com.example.attendanceManagementSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAn5jbD6YS_KEfrqSA-GPGHIyuVLCQAwyo',
    appId: '1:953009996983:ios:56f89ab82903fa72aeb932',
    messagingSenderId: '953009996983',
    projectId: 'attendance-management-sy-3d1cc',
    storageBucket: 'attendance-management-sy-3d1cc.appspot.com',
    iosBundleId: 'com.example.attendanceManagementSystem.RunnerTests',
  );
}
