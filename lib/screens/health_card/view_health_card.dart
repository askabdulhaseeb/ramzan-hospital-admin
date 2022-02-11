import 'package:flutter/material.dart';
import 'edit_health_card.dart';

class ViewHealthCard extends StatelessWidget {
  const ViewHealthCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Health Card',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditHealthCard(),
              ));
            },
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
