import 'package:cloud_firestore/cloud_firestore.dart';

import '../enums/user_type_enum.dart';

class AppUser {
  AppUser({
    required this.uid,
    this.name,
    this.phoneNumber,
    this.email,
    this.imageURL = '',
    this.type = UserTypeEnum.STAFF,
    this.departments,
    this.isBlocked = false,
    this.isAdmin = false,
  });
  final String uid;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final UserTypeEnum type;
  final String? imageURL;
  final List<String>? departments;
  final bool? isBlocked;
  final bool? isAdmin;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
      'type': UserTypeEnumConverter.fromEnum(type),
      'imageURL': imageURL,
      'departments': departments,
      'is_blocked': isBlocked,
      'is_admin': isAdmin,
    };
  }

  // ignore: sort_constructors_first
  factory AppUser.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return AppUser(
      uid: doc.data()?['uid'] ?? '',
      name: doc.data()?['name'] ?? '',
      phoneNumber: doc.data()?['phone_number'] ?? '',
      email: doc.data()?['email'] ?? '',
      type: UserTypeEnumConverter.fromString(
        doc.data()?['type'] ?? UserTypeEnum.STAFF,
      ),
      imageURL: doc.data()?['imageURL'] ?? '',
      departments: List<String>.from(doc.data()?['departments'] ?? <String>[]),
      isBlocked: doc.data()?['is_blocked'] ?? false,
      isAdmin: doc.data()?['is_admin'] ?? false,
    );
  }
}
