import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../models/patient.dart';
import '../widgets/custom_toast.dart';

class PatientAPI{
  static const String _collection = 'patients';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  // functions
  Future<List<Patient>> getAllPatients() async {
    final List<Patient> patient = <Patient>[];
    try {
      final QuerySnapshot<Map<String, dynamic>> doc =
          await _instance.collection(_collection).get();
      if (doc.docs.isEmpty) return patient;
      for (DocumentSnapshot<Map<String, dynamic>> element in doc.docs) {
        patient.add(Patient.fromDoc(element));
      }
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
    }
    return patient;
  }

  Future<Patient?>? getInfo({required String uid}) async {
    final DocumentSnapshot<Map<String, dynamic>>? doc =
        await _instance.collection(_collection).doc(uid).get();
    if (doc?.data() == null) return null;
    return Patient.fromDoc(doc!);
  }

  Future<bool> addPatient(Patient patient) async {
    try {
      await _instance
          .collection(_collection)
          .doc(patient.pid)
          .set(patient.toMap());
      return true;
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
      return false;
    }
  }

  Future<String> uploadImage(File file, String uid) async {
    TaskSnapshot snapshot =
        await FirebaseStorage.instance.ref('profile_images/$uid').putFile(file);
    String url = (await snapshot.ref.getDownloadURL()).toString();
    return url;
  }
}