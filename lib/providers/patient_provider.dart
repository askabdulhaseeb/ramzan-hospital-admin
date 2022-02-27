import 'package:flutter/material.dart';

import '../database/patient_api.dart';
import '../models/patient.dart';

class TestProvider extends ChangeNotifier {
  List<Patient> _patient = <Patient>[];
  bool _requestDone = false;

  List<Patient> get patients => _patient;

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
    List<Patient> _temp = await PatientAPI().getAllPatients();
    _patient = _temp;
    notifyListeners();
    print('Print: test_Provider.dart: No of Test: ${_patient.length}');
  }
}