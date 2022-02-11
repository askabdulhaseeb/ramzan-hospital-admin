import 'package:flutter/material.dart';
import 'package:ramzanadmin/screens/departments/add_department.dart';
import 'package:ramzanadmin/screens/departments/edit_department.dart';
import 'package:ramzanadmin/screens/departments/view_department.dart';
import 'package:ramzanadmin/screens/doctors/add_doctor.dart';
import 'package:ramzanadmin/screens/doctors/edit_doctor.dart';
import 'package:ramzanadmin/screens/doctors/view_doctor.dart';

import '../../widgets/custom_icon_title_button.dart';

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
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ViewDepartment(),
                  ));
                },
                title: Text('Departments Name $index'),
                trailing: IconButton(
                  splashRadius: 24,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditDepartment(),
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
