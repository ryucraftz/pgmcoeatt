
class Class {
  final String name;

  Class({required this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
