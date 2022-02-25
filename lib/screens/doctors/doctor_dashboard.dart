import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../enums/user_type_enum.dart';
import '../../models/app_user.dart';
import '../../providers/user_provider.dart';
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
            child: Consumer<UserProvider>(
                builder: (_, UserProvider userProvider, __) {
              List<AppUser> _doctor = userProvider.doctors();
              return _doctor.isEmpty
                  ? const Center(
                      child: Text('No doctor available yet!'),
                    )
                  : ListView.separated(
                      itemCount: _doctor.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<ViewDoctor>(
                            builder: (BuildContext context) =>
                                ViewDoctor(doctor: _doctor[index]),
                          ));
                        },
                        title:
                            Text(_doctor[index].name ?? 'name fetching issue'),
                        subtitle: Text(UserTypeEnumConverter.fromEnum(
                          _doctor[index].type,
                        )),
                        trailing: IconButton(
                          splashRadius: 24,
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute<EditDoctor>(
                              builder: (BuildContext context) => EditDoctor(
                                doctor: _doctor[index],
                              ),
                            ));
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    );
            }),
          ),
        ],
      ),
    );
  }
}
