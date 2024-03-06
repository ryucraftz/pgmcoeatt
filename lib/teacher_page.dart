import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pgmcoe_att/login_page.dart';

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PGMCOE ATTENDANCE'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPageWidget()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // Add your logic for handling the button press here
          },
          child: Text('Classes'),
        ),
      ),
    );
  }
}
