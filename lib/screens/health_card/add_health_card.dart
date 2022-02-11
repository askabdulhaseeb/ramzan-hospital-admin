import 'package:flutter/material.dart';

class AddHealthCard extends StatefulWidget {
  const AddHealthCard({Key? key}) : super(key: key);
  static const String routeName = '/AddHealthCard';
  @override
  State<AddHealthCard> createState() => _AddHealthCardState();
}

class _AddHealthCardState extends State<AddHealthCard> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _fee = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Health Card',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
