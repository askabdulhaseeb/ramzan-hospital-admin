import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/department_provider.dart';
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
            child: Consumer<DepartmentProvider>(
              builder: (_, DepartmentProvider provider, __) => ListView.separated(
                itemCount: provider.departments.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute<ViewDepartment>(
                      builder: (BuildContext context) => ViewDepartment(
                        department: provider.departments[index],
                      ),
                    ));
                  },
                  title: Text(provider.departments[index].name),
                  trailing: IconButton(
                    splashRadius: 24,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute<EditDepartment>(
                        builder: (BuildContext context) => EditDepartment(
                          department: provider.departments[index],
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
