import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:notesadmin/views/Screens/screen_notes.dart';
import 'package:notesadmin/views/Screens/screen_log_in.dart';

import 'firebase_options.dart';

Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? ScreenLogIn()
          : ScreenNotes(),
    );
  }
}
