import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lab_test.dart';
import '../widgets/custom_toast.dart';

class TestAPI {
  static const String _collection = 'tests';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  // functions
  Future<List<LabTest>> getAllTests() async {
    final List<LabTest> labTest = <LabTest>[];
    try {
      final QuerySnapshot<Map<String, dynamic>> doc =
          await _instance.collection(_collection).get();
      if (doc.docs.isEmpty) return labTest;
      for (DocumentSnapshot<Map<String, dynamic>> element in doc.docs) {
        labTest.add(LabTest.fromDoc(element));
      }
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
    }
    return labTest;
  }

  // functions
  Future<LabTest?>? getTestInfo({required String uid}) async {
    final DocumentSnapshot<Map<String, dynamic>>? doc =
        await _instance.collection(_collection).doc(uid).get();
    if (doc?.data() == null) return null;
    return LabTest.fromDoc(doc!);
  }

  Future<bool> addTest(LabTest labTest) async {
    try {
      await _instance
          .collection(_collection)
          .doc(labTest.id)
          .set(labTest.toMap());
      return true;
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
      return false;
    }
  }
}
