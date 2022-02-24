import 'package:flutter/material.dart';
import '../database/department_api.dart';
import '../models/department.dart';

class DepartmentProvider extends ChangeNotifier {
  List<Department> _departments = <Department>[];

  void init() {
    _initDepartment();
  }

  void refresh() {
    _departments = <Department>[];
    _initDepartment();
  }

  List<Department> get departments => <Department>[..._departments];

  void _initDepartment() async {
    if (_departments.isNotEmpty) return;
    final List<Department> _temp = await DepartmentAPI().departments();
    _departments = _temp;
    print(
      'Print: App_Provider.dart: No of Departments: ${_departments.length}',
    );
    notifyListeners();
  }
}
