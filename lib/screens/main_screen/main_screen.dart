import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramzanadmin/screens/pages/home_page.dart';
import '../../providers/main_bottom_nav_bar_provider.dart';
import 'main_bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String routeName = '/MainScreen';

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    Center(child: Text('2')),
    Center(child: Text('3')),
  ];
  @override
  Widget build(BuildContext context) {
    final MainBottomNavBarProvider _provider =
        Provider.of<MainBottomNavBarProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: _pages[_provider.currentTap],
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
