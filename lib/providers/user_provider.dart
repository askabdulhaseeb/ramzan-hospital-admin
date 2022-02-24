import 'package:flutter/material.dart';

import '../database/user_api.dart';
import '../models/app_user.dart';

class UserProvider extends ChangeNotifier {
  List<AppUser> _users = <AppUser>[];
  bool _requestDone = false;

  List<AppUser> get users => _users;

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
    _users.addAll(await UserAPI().getAllUsers());
    notifyListeners();
    print('Print: App_Provider.dart: No of Users: ${_users.length}');
  }
}
