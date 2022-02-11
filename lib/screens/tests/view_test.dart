import 'package:flutter/material.dart';

import 'edit_test.dart';

class ViewTest extends StatelessWidget {
  const ViewTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Test',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditTest(),
              ));
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
