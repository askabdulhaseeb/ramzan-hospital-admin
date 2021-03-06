import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/app_user.dart';
import '../widgets/custom_toast.dart';

class UserAPI {
  static const String _collection = 'users';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  // functions
  Future<List<AppUser>> getAllUsers() async {
    final List<AppUser> appUser = <AppUser>[];
    try {
      final QuerySnapshot<Map<String, dynamic>> doc =
          await _instance.collection(_collection).get();
      if (doc.docs.isEmpty) return appUser;
      for (DocumentSnapshot<Map<String, dynamic>> element in doc.docs) {
        appUser.add(AppUser.fromDoc(element));
      }
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
    }
    return appUser;
  }

  Future<AppUser?>? getInfo({required String uid}) async {
    final DocumentSnapshot<Map<String, dynamic>>? doc =
        await _instance.collection(_collection).doc(uid).get();
    if (doc?.data() == null) return null;
    return AppUser.fromDoc(doc!);
  }

  Future<bool> addUser(AppUser appUser) async {
    try {
      await _instance
          .collection(_collection)
          .doc(appUser.uid)
          .set(appUser.toMap());
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
