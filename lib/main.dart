import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pgmcoe_att/firebase_options.dart';
import 'package:pgmcoe_att/user_auth/firebase_auth/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
