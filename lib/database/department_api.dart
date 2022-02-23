import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/department.dart';
import '../widgets/custom_toast.dart';

class DepartmentAPI {
  static const String _colloction = 'departments';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Future<bool> add(Department department) async {
    try {
      _instance
          .collection(_colloction)
          .doc(department.id)
          .set(department.toMap());
      return true;
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
      return false;
    }
  }

  Future<Department?> department({required String id}) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> doc =
          await _instance.collection(_colloction).doc(id).get();
      return Department.fromDoc(doc);
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
      return null;
    }
  }

  Future<List<Department>> departments() async {
    List<Department> _dep = <Department>[];
    try {
      final QuerySnapshot<Map<String, dynamic>> docs =
          await _instance.collection(_colloction).get();
      for (DocumentSnapshot<Map<String, dynamic>> doc in docs.docs) {
        _dep.add(Department.fromDoc(doc));
      }
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
    }
    return _dep;
  }
}
