import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/department_provider.dart';
import '../../providers/test_provider.dart';
import '../../providers/user_provider.dart';
import '../../utilities/app_images.dart';
import '../../widgets/report_card.dart';
import '../departments/department_dashboard.dart';
import '../doctors/doctor_dashboard.dart';
import '../health_card/health_card_dashboard.dart';
import '../patients/patient_dashboard.dart';
import '../tests/test_dashboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Consumer<DepartmentProvider>(
              builder: (_, DepartmentProvider value, __) => ReportCard(
                title: 'Departments',
                imagePath: AppImages.womanDoctor,
                child: _titleAndCount(
                  title: 'No. of Departments',
                  count: value.departments.length,
                ),
                onTap: () => Navigator.of(context)
                    .pushNamed(DepartmentDashboard.routeName),
              ),
            ),
            Consumer<UserProvider>(
              builder: (_, UserProvider doctProvider, __) => ReportCard(
                title: 'Doctors',
                imagePath: AppImages.doctorTab,
                child: _titleAndCount(
                  title: 'No. of Doctors',
                  count: doctProvider.doctors().length,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(DoctorDashboard.routeName),
              ),
            ),
            // ReportCard(
            //   title: 'Health Card',
            //   imagePath: AppImages.card,
            //   child: _titleAndCount(title: 'No. of Heath Card', count: 0),
            //   subtitle: 'Will add soon',
            // onTap: () => Navigator.of(context)
            //     .pushNamed(HealthCardDashboard.routeName),
            // ),
            Consumer<TestProvider>(
              builder: (_, TestProvider testProvider, __) => ReportCard(
                title: 'Tests',
                imagePath: AppImages.apprates,
                child: _titleAndCount(
                  title: 'No. of Tests',
                  count: testProvider.tests.length,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(TestDashboard.routeName),
              ),
            ),
            ReportCard(
              title: 'patients',
              imagePath: AppImages.doctor,
              child: _titleAndCount(title: 'No. of patients', count: 24),
              onTap: () =>
                  Navigator.of(context).pushNamed(PatientDashboard.routeName),
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
