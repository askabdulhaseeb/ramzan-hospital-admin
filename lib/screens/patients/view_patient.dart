import 'package:flutter/material.dart';
import 'edit_patient.dart';

class ViewPatient extends StatelessWidget {
  const ViewPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Patient',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute<EditPatient>(
                builder: (BuildContext context) => const EditPatient(),
              ));
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
