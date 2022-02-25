import 'package:flutter/material.dart';

import '../database/test_api.dart';
import '../models/lab_test.dart';

class TestProvider extends ChangeNotifier {
  List<LabTest> _tests = <LabTest>[];
  bool _requestDone = false;

  List<LabTest> get tests => _tests;

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
    List<LabTest> _temp = await TestAPI().getAllTests();
    _tests = _temp;
    notifyListeners();
    print('Print: test_Provider.dart: No of Test: ${_tests.length}');
  }
}
