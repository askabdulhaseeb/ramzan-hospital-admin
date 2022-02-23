import 'package:flutter/material.dart';
import 'add_patient.dart';
import '../../widgets/custom_icon_title_button.dart';
import 'edit_patient.dart';
import 'view_patient.dart';

class PatientDashboard extends StatelessWidget {
  const PatientDashboard({Key? key}) : super(key: key);
  static const String routeName = '/PatientDashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patients',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          CustomIconTitleButton(
            title: 'Add Patient',
            onTap: () => Navigator.of(context).pushNamed(AddPatient.routeName),
          ),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView.separated(
              itemCount: 200,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (BuildContext context, int index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute<ViewPatient>(
                    builder: (BuildContext context) => const ViewPatient(),
                  ));
                },
                title: Text('Patient Name $index'),
                trailing: IconButton(
                  splashRadius: 24,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<EditPatient>(
                      builder: (BuildContext context) => const EditPatient(),
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
