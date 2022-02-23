import 'package:flutter/material.dart';

import '../database/department_api.dart';
import '../database/user_api.dart';
import '../models/app_user.dart';
import '../models/department.dart';

class AppProvider extends ChangeNotifier {
  final List<AppUser> _user = <AppUser>[];
  final List<Department> _departments = <Department>[];

  void init() async {
    _initUser();
    _initDepartment();
  }

  void refresh() async {
    _user.clear();
    _departments.clear();
    _initUser();
    _initDepartment();
  }

  List<AppUser> get users => <AppUser>[..._user];
  List<Department> get departments => <Department>[..._departments];

  void _initUser() async {
    if (_user.isNotEmpty) return;
    _user.addAll(await UserAPI().getAllUsers());
    //   UserLocalData().storeAppUserData(
    //     appUser: _user.firstWhere(
    //   (AppUser element) => element.uid == AuthMethods.uid,
    // ));
    print('Print: App_Provider.dart: No of Users: ${_user.length}');
  }

  void _initDepartment() async {
    if (_departments.isNotEmpty) return;
    _departments.addAll(await DepartmentAPI().departments());
    print(
        'Print: App_Provider.dart: No of Departments: ${_departments.length}');
  }
}
