import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramzanadmin/providers/main_bottom_nav_bar_provider.dart';
import 'package:ramzanadmin/screens/auth/login_screen.dart';
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
          ),
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
        routes: <String, WidgetBuilder>{
          LoginScreen.routeName: (_) => const LoginScreen(),
          MainScreen.routeName: (_) => const MainScreen(),
        },
      ),
    );
  }
}
