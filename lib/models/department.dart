import 'package:cloud_firestore/cloud_firestore.dart';

class Department {
  Department({
    required this.id,
    required this.name,
    this.createdBy,
    this.timestamp,
  });

  final String id;
  final String name;
  final String? createdBy;
  final int? timestamp;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'createdBy': createdBy,
      'timestamp': timestamp,
    };
  }

  // ignore: sort_constructors_first
  factory Department.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Department(
      id: doc.data()?['id'] ?? '',
      name: doc.data()?['name'] ?? '',
      createdBy: doc.data()?['createdBy'] ?? '',
      timestamp: doc.data()?['timestamp'] ?? 0,
    );
  }
}
