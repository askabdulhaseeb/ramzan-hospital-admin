import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/test_provider.dart';
import '../../widgets/custom_icon_title_button.dart';
import 'add_test.dart';
import 'edit_test.dart';
import 'view_test.dart';

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
            child: Consumer<TestProvider>(
              builder: (_, TestProvider provider, __) => ListView.separated(
                itemCount: provider.tests.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<ViewTest>(
                      builder: (BuildContext context) => ViewTest(
                        labTest: provider.tests[index],
                      ),
                    ));
                  },
                  title: Text(provider.tests[index].name),
                  trailing: IconButton(
                    splashRadius: 24,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<EditTest>(
                        builder: (BuildContext context) => EditTest(
                          test: provider.tests[index],
                        ),
                      ));
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
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
