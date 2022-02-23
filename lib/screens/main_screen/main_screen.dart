import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../utilities/app_images.dart';
import '../../widgets/app_name.dart';
import '../../providers/main_bottom_nav_bar_provider.dart';
import '../pages/home_page.dart';
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
    Provider.of<AppProvider>(context).init();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const AppName(),
        actions:<Widget> [
          SizedBox(
            height: 60,
            child: Image.asset(AppImages.logo),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: _pages[_provider.currentTap],
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
