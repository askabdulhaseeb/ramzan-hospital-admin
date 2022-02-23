import 'package:flutter/material.dart';

class AddTest extends StatefulWidget {
  const AddTest({Key? key}) : super(key: key);
  static const String routeName = '/AddTest';
  @override
  State<AddTest> createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _fee = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Test',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
