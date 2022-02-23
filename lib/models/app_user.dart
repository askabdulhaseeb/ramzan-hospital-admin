import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  AppUser({
    required this.uid,
    this.name,
    this.phoneNumber,
    this.email,
    this.imageURL = '',
    this.departments,
    this.isBlocked = false,
  });
  final String uid;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? imageURL;
  final List<String>? departments;
  final bool? isBlocked;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
      'imageURL': imageURL,
      'departments': departments,
      'isBlocked': isBlocked,
    };
  }

  // ignore: sort_constructors_first
  factory AppUser.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return AppUser(
      uid: doc.data()?['uid'] ?? '',
      name: doc.data()?['name'] ?? '',
      phoneNumber: doc.data()?['phone_number'] ?? '',
      email: doc.data()?['email'] ?? '',
      imageURL: doc.data()?['imageURL'] ?? '',
      departments: List<String>.from(doc.data()?['departments'] ?? <String>[]),
      isBlocked: doc.data()?['isBlocked'] ?? false,
    );
  }
}
