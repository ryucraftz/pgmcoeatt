import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PGMCOE ATTENDACE'),
      ),
      body: Center(
        child: Text('Classes'),
      ),
    );
  }
}
