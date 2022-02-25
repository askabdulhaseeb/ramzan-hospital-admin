import 'package:flutter/material.dart';
import '../../models/app_user.dart';
import '../../widgets/circular_profile_image.dart';
import 'edit_doctor.dart';

class ViewDoctor extends StatelessWidget {
  const ViewDoctor({required this.doctor, Key? key}) : super(key: key);
  final AppUser doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Doctor',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute<EditDoctor>(
                builder: (BuildContext context) => EditDoctor(doctor: doctor),
              ));
            },
            child: const Text('Edit'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircularProfileImage(imageURL: doctor.imageURL ?? ''),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      doctor.name ?? 'issues in name',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      doctor.email ?? 'issue in mail',
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
