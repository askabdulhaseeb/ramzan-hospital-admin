import 'package:flutter/material.dart';
import '../../widgets/custom_icon_title_button.dart';
import 'add_department.dart';
import 'edit_department.dart';
import 'view_department.dart';

class DepartmentDashboard extends StatelessWidget {
  const DepartmentDashboard({Key? key}) : super(key: key);
  static const String routeName = '/DepartmentDashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Departments',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          CustomIconTitleButton(
            title: 'Add Departments',
            onTap: () =>
                Navigator.of(context).pushNamed(AddDepartment.routeName),
          ),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView.separated(
              itemCount: 200,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (BuildContext context, int index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute<ViewDepartment>(
                    builder: (BuildContext context) => const ViewDepartment(),
                  ));
                },
                title: Text('Departments Name $index'),
                trailing: IconButton(
                  splashRadius: 24,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<EditDepartment>(
                      builder: (BuildContext context) => const EditDepartment(),
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
        ],
      ),
    );
  }
}
