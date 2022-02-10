import 'package:flutter/material.dart';

import 'edit_doctor.dart';

class ViewDoctor extends StatelessWidget {
  const ViewDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Doctor',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditDoctor(),
              ));
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
