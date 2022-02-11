import 'package:flutter/material.dart';
import '../../widgets/custom_icon_title_button.dart';
import 'add_health_card.dart';
import 'edit_health_card.dart';
import 'view_health_card.dart';

class HealthCardDashboard extends StatelessWidget {
  const HealthCardDashboard({Key? key}) : super(key: key);
  static const String routeName = '/HealthCardDashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Cards',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          CustomIconTitleButton(
            title: 'Add Health Card',
            onTap: () =>
                Navigator.of(context).pushNamed(AddHealthCard.routeName),
          ),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView.separated(
              itemCount: 200,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ViewHealthCard(),
                  ));
                },
                title: Text('Health Card Name $index'),
                trailing: IconButton(
                  splashRadius: 24,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditHealthCard(),
                    ));
                  },
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
