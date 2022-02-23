import 'package:flutter/material.dart';
import 'edit_department.dart';

class ViewDepartment extends StatelessWidget {
  const ViewDepartment({Key? key}) : super(key: key);

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
                builder: (BuildContext context) => const EditDepartment(),
              ));
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
