import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCqZ6RA4eOUZElBE36CzAz-iNUKUmaHvC0",
            authDomain: "liams-yardand-trash-can-rz1c29.firebaseapp.com",
            projectId: "liams-yardand-trash-can-rz1c29",
            storageBucket: "liams-yardand-trash-can-rz1c29.firebasestorage.app",
            messagingSenderId: "209538084276",
            appId: "1:209538084276:web:abdcb65e468fabeeda56e1"));
  } else {
    await Firebase.initializeApp();
  }
}
