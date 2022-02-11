import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramzanadmin/providers/main_bottom_nav_bar_provider.dart';
import 'package:ramzanadmin/screens/auth/login_screen.dart';
import 'package:ramzanadmin/screens/departments/add_department.dart';
import 'package:ramzanadmin/screens/departments/department_dashboard.dart';
import 'package:ramzanadmin/screens/doctors/add_doctor.dart';
import 'package:ramzanadmin/screens/doctors/doctor_dashboard.dart';
import 'package:ramzanadmin/screens/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MainBottomNavBarProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.blue),
          ),
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
        routes: <String, WidgetBuilder>{
          LoginScreen.routeName: (_) => const LoginScreen(),
          MainScreen.routeName: (_) => const MainScreen(),
          // Doctor
          DoctorDashboard.routeName: (_) => const DoctorDashboard(),
          AddDoctor.routeName: (_) => const AddDoctor(),
          //Departments
          DepartmentDashboard.routeName: (_) => const DepartmentDashboard(),
          AddDepartment.routeName: (_) => const AddDepartment(),
        },
      ),
    );
  }
}
