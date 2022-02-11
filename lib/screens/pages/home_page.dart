import 'package:flutter/material.dart';
import 'package:ramzanadmin/screens/departments/department_dashboard.dart';
import 'package:ramzanadmin/screens/doctors/doctor_dashboard.dart';
import 'package:ramzanadmin/screens/tests/test_dashboard.dart';

import 'package:ramzanadmin/utilities/app_images.dart';

import '../../widgets/report_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ReportCard(
              title: 'Departments',
              imagePath: AppImages.womanDoctor,
              child: _titleAndCount(title: 'No. of Doctors', count: 12),
              onTap: () => Navigator.of(context)
                  .pushNamed(DepartmentDashboard.routeName),
            ),
            ReportCard(
              title: 'Doctors',
              imagePath: AppImages.doctorTab,
              child: _titleAndCount(title: 'No. of Doctors', count: 12),
              onTap: () =>
                  Navigator.of(context).pushNamed(DoctorDashboard.routeName),
            ),
            ReportCard(
              title: 'Tests',
              imagePath: AppImages.apprates,
              child: _titleAndCount(title: 'No. of Tests', count: 12),
              onTap: () =>
                  Navigator.of(context).pushNamed(TestDashboard.routeName),
            ),
            ReportCard(
              title: 'Heath Card',
              imagePath: AppImages.card,
              child: _titleAndCount(title: 'No. of Heath Card', count: 4),
              onTap: () {},
            ),
            ReportCard(
              title: 'patients',
              imagePath: AppImages.doctor,
              child: _titleAndCount(title: 'No. of patients', count: 24),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleAndCount({required String title, required int count}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          Text(
            '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            '$count',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
