import 'dart:convert';
import 'dart:core';

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
    return {
      'uid': uid,
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
      'imageURL': imageURL,
      'departments': departments,
      'isBlocked': isBlocked,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      email: map['email'] ?? '',
      imageURL: map['imageURL'] ?? '',
      departments: List<String>.from(map['departments']),
      isBlocked: map['isBlocked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));
}
