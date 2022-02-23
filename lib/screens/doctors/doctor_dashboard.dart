import 'package:flutter/material.dart';
import '../../widgets/custom_icon_title_button.dart';
import 'add_doctor.dart';
import 'edit_doctor.dart';
import 'view_doctor.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({Key? key}) : super(key: key);
  static const String routeName = '/DoctorDashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctors',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          CustomIconTitleButton(
            title: 'Add Doctor',
            onTap: () => Navigator.of(context).pushNamed(AddDoctor.routeName),
          ),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView.separated(
              itemCount: 200,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (BuildContext context, int index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute<ViewDoctor>(
                    builder: (BuildContext context) => const ViewDoctor(),
                  ));
                },
                title: Text('Doctor Name $index'),
                subtitle: Text('Doctor Fee $index'),
                trailing: IconButton(
                  splashRadius: 24,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<EditDoctor>(
                      builder: (BuildContext context) => const EditDoctor(),
                    ));
                  },
                  icon:  Icon(
                    Icons.edit_outlined,
                    color: Theme.of(context).colorScheme.secondary,
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
