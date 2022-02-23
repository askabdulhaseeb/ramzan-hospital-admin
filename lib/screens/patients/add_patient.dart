import 'package:flutter/material.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({Key? key}) : super(key: key);
  static const String routeName = '/AddPatient';
  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _fee = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Patient',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
