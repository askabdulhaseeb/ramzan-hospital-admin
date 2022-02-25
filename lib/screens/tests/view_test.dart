import 'package:flutter/material.dart';
import '../../models/lab_test.dart';
import 'edit_test.dart';

class ViewTest extends StatelessWidget {
  const ViewTest({required this.labTest, Key? key}) : super(key: key);
  final LabTest labTest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Test',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute<EditTest>(
                builder: (BuildContext context) => EditTest(test: labTest),
              ));
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
