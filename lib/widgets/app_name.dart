import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Text>[
        Text(
          'Ramzan',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          'Clinic',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 30,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
