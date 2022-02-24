import 'package:flutter/material.dart';
import '../../models/department.dart';
import 'edit_department.dart';

class ViewDepartment extends StatelessWidget {
  const ViewDepartment({required this.department, Key? key}) : super(key: key);
  final Department department;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Department',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute<EditDepartment>(
                builder: (BuildContext context) => EditDepartment(
                  department: department,
                ),
              ));
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
