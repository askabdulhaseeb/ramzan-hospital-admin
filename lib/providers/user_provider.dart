import 'package:flutter/material.dart';

import '../database/user_api.dart';
import '../enums/user_type_enum.dart';
import '../models/app_user.dart';

class UserProvider extends ChangeNotifier {
  List<AppUser> _users = <AppUser>[];
  bool _requestDone = false;

  List<AppUser> get users => _users;

  List<AppUser> doctors() {
    List<AppUser> _temp = <AppUser>[];
    _temp = _users
        .where((AppUser element) => element.type == UserTypeEnum.DOCTOR)
        .cast<AppUser>()
        .toList();
    return _temp;
  }

  void init() {
    _init();
    _requestDone = true;
  }

  void refresh() {
    _requestDone = false;
    _init();
  }

  _init() async {
    if (_requestDone) return;
    List<AppUser> _temp = await UserAPI().getAllUsers();
    _users = _temp;
    print(_users[0].type);
    notifyListeners();
    print('Print: App_Provider.dart: No of Users: ${_users.length}');
  }
}
