import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../enums/gender_type_enum.dart';

class Patient {
  Patient({
    required this.pid,
    this.name,
    this.contact,
    this.gender,
    this.imageURL,
    this.history,
    this.address,
    this.heatchCard,
  });

  final String pid;
  String? name;
  GenderTypeEnum? gender;
  String? contact;
  String? imageURL;
  List<String>? history;
  String? address;
  String? heatchCard;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pid': pid,
      'name': name,
      'gender': GenderTypeEnumConverter.fromEnum(gender ?? GenderTypeEnum.MALE),
      'contact': contact,
      'imageURL': imageURL,
      'history': history,
      'address': address,
      'heatchCard': heatchCard,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      pid: map['pid'] ?? '',
      name: map['name'] ?? '',
      contact: map['contact'] ?? '',
      gender: GenderTypeEnumConverter.fromString(map['gender'] ?? 'MALE'),
      imageURL: map['imageURL'] ?? '',
      history: List<String>.from(map['history']),
      address: map['address'] ?? '',
      heatchCard: map['heatchCard'] ?? '',
    );
  }

  factory Patient.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Patient(
      pid: doc.data()?['pid'] ?? '',
      name: doc.data()?['name'] ?? '',
      contact: doc.data()?['contact'] ?? '',
      gender:
          GenderTypeEnumConverter.fromString(doc.data()?['gender'] ?? 'MALE'),
      imageURL: doc.data()?['imageURL'] ?? '',
      history: List<String>.from(doc.data()?['history']),
      address: doc.data()?['address'] ?? '',
      heatchCard: doc.data()?['heatchCard'] ?? '',
    );
  }
}
