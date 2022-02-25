import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/department_provider.dart';
import 'providers/main_bottom_nav_bar_provider.dart';
import 'providers/test_provider.dart';
import 'providers/user_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/departments/add_department.dart';
import 'screens/departments/department_dashboard.dart';
import 'screens/doctors/add_doctor.dart';
import 'screens/doctors/doctor_dashboard.dart';
import 'screens/health_card/add_health_card.dart';
import 'screens/health_card/health_card_dashboard.dart';
import 'screens/main_screen/main_screen.dart';
import 'screens/patients/add_patient.dart';
import 'screens/patients/patient_dashboard.dart';
import 'screens/tests/add_test.dart';
import 'screens/tests/test_dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const Color _primary = Color(0xFF189643);
    const Color _secondary = Color(0xFFFA8D01);
    return MultiProvider(
      // ignore: always_specify_types
      providers: [
        ChangeNotifierProvider<MainBottomNavBarProvider>.value(
          value: MainBottomNavBarProvider(),
        ),
        ChangeNotifierProvider<DepartmentProvider>.value(
          value: DepartmentProvider(),
        ),
        ChangeNotifierProvider<UserProvider>.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider<TestProvider>.value(
          value: TestProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Ramzan Hospital',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: _secondary),
          ),
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: _primary,
            onPrimary: Colors.green,
            secondary: _secondary,
            onSecondary: Colors.orange,
            error: Colors.red,
            onError: Colors.redAccent,
            background: Colors.white,
            onBackground: Colors.grey,
            surface: Colors.white,
            onSurface: Colors.grey,
          ),
          primaryColor: _primary,
        ),
        home: const MainScreen(),
        routes: <String, WidgetBuilder>{
          LoginScreen.routeName: (_) => const LoginScreen(),
          MainScreen.routeName: (_) => const MainScreen(),
          // Doctor
          DoctorDashboard.routeName: (_) => const DoctorDashboard(),
          AddDoctor.routeName: (_) => const AddDoctor(),
          // Departments
          DepartmentDashboard.routeName: (_) => const DepartmentDashboard(),
          AddDepartment.routeName: (_) => const AddDepartment(),
          // Tests
          TestDashboard.routeName: (_) => const TestDashboard(),
          AddTest.routeName: (_) => const AddTest(),
          // Health Card
          HealthCardDashboard.routeName: (_) => const HealthCardDashboard(),
          AddHealthCard.routeName: (_) => const AddHealthCard(),
          // Patients
          PatientDashboard.routeName: (_) => const PatientDashboard(),
          AddPatient.routeName: (_) => const AddPatient(),
        },
      ),
    );
  }
}
