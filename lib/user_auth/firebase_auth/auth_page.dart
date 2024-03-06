import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pgmcoe_att/login_page.dart';
import 'package:pgmcoe_att/teacher_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) { // <-- Corrected line
            return TeacherPage();
          } else {
            return LoginPageWidget();
          }
        },
      ),
    );
  }
}
