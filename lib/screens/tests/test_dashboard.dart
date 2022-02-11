import 'package:flutter/material.dart';
import 'package:ramzanadmin/screens/tests/add_test.dart';
import 'package:ramzanadmin/screens/tests/edit_test.dart';
import 'package:ramzanadmin/screens/tests/view_test.dart';
import '../../widgets/custom_icon_title_button.dart';

class TestDashboard extends StatelessWidget {
  const TestDashboard({Key? key}) : super(key: key);
  static const String routeName = '/TestDashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tests',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          CustomIconTitleButton(
            title: 'Add Test',
            onTap: () => Navigator.of(context).pushNamed(AddTest.routeName),
          ),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView.separated(
              itemCount: 200,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ViewTest(),
                  ));
                },
                title: Text('Test Name $index'),
                trailing: IconButton(
                  splashRadius: 24,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditTest(),
                    ));
                  },
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
