import 'package:cloud_firestore/cloud_firestore.dart';

class LabTest {
  LabTest({
    required this.id,
    required this.name,
    required this.fee,
  });

  final String id;
  final String name;
  final double fee;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'fee': fee,
    };
  }

  // ignore: sort_constructors_first
  factory LabTest.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return LabTest(
      id: doc.data()?['id'] ?? '',
      name: doc.data()?['name'] ?? '',
      fee: doc.data()?['fee'] ?? 0.0,
    );
  }
}
