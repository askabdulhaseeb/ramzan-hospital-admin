import 'package:flutter/material.dart';

class AddDepartment extends StatefulWidget {
  const AddDepartment({Key? key}) : super(key: key);
  static const String routeName = '/AddDepartment';
  @override
  State<AddDepartment> createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _fee = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Department',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
