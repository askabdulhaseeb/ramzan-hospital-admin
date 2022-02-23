import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/department_api.dart';
import '../../models/department.dart';
import '../../providers/app_provider.dart';
import '../../utilities/custom_validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_textformfield.dart';
import '../../widgets/show_loading.dart';

class AddDepartment extends StatefulWidget {
  const AddDepartment({Key? key}) : super(key: key);
  static const String routeName = '/AddDepartment';
  @override
  State<AddDepartment> createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  final TextEditingController _name = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Department',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              CustomTextFormField(
                controller: _name,
                hint: 'Department Name',
                autoFocus: true,
                validator: (String? value) => CustomValidator.lessThen2(value),
              ),
              const SizedBox(height: 16),
              _isLoading
                  ? const ShowLoading()
                  : CustomElevatedButton(
                      title: 'Add Department'.toUpperCase(),
                      onTap: () async {
                        if (_key.currentState?.validate() ?? false) {
                          final int _time =
                              DateTime.now().microsecondsSinceEpoch;
                          final bool _ok = await DepartmentAPI().add(Department(
                            id: _time.toString(),
                            name: _name.text.trim(),
                            createdBy: 'Me',
                            timestamp: _time,
                          ));
                          if (_ok) {
                            Provider.of<AppProvider>(context, listen: false)
                                .refresh();
                            Navigator.of(context).pop();
                          }
                        }
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
