// Import necessary packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Teacher Page"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Classes").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Some error occurred: ${snapshot.error}"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DropdownMenuItem> programItems = [];

          snapshot.data!.docs.forEach((doc) {
            programItems.add(
              DropdownMenuItem(
                value: doc.id,
                child: Text(
                  doc['class'], // Accessing the 'class' field
                ),
              ),
            );
          });

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.only(right: 15, left: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton(
                underline: const SizedBox(),
                isExpanded: true,
                hint: const Text(
                  "Select the Items",
                  style: TextStyle(fontSize: 20),
                ),
                value: selectedValue,
                items: programItems,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String?;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
