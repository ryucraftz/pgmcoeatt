import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pgmcoe_att/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'class_model.dart'; // Import your Class model

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  double screenHeight = 0;
  double screenWeight = 0;

  Color primary = const Color(0xFF507583);

  List<String> classes = [];

  @override
  void initState() {
    super.initState();
    // Load classes from Firestore
    loadClasses();
  }

  @override
  Widget build(BuildContext context) {
    screenWeight = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
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
      
      bottomNavigationBar: Container(
        height: 70,
        margin: EdgeInsets.only(left: 12, right: 12, bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Button to add a new class
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Implement add class functionality here
                    // For example, show a dialog to enter class name
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Add Class'),
                        content: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter class name',
                          ),
                          onChanged: (value) {
                            // You can handle text field changes if needed
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Get the entered class name from text field
                              String className = ''; // Get the value from the text field
                              addClass(className);
                              Navigator.pop(context);
                            },
                            child: Text('Add'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: screenHeight,
                    width: screenWeight,
                    color: Colors.white,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: primary,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Implement functionality to open the selected class
            },
            child: Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  classes[index],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to add a new class to Firestore
  void addClass(String className) async {
    try {
      await FirebaseFirestore.instance.collection('classes').add({'name': className});
      // Reload classes from Firestore
      loadClasses();
      // Optionally, you can update the UI or show a message indicating success
      print('Class added successfully!');
    } catch (e) {
      // Handle errors
      print('Error adding class: $e');
    }
  }

  // Function to load classes from Firestore
  void loadClasses() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('classes').get();
      final List<String> loadedClasses = querySnapshot.docs.map((doc) => doc['name'] as String).toList();
      setState(() {
        classes = loadedClasses;
      });
    } catch (e) {
      // Handle errors
      print('Error loading classes: $e');
    }
  }
}
