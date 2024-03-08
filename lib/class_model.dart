// class_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class ClassModel {
  final String id;
  final String name;
  final String description;
  final int capacity;

  ClassModel({
    required this.id, // Updated to include 'required'
    required this.name,
    required this.description,
    required this.capacity,
  });

  factory ClassModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ClassModel(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      capacity: data['capacity'] ?? 0,
    );
  }
}
