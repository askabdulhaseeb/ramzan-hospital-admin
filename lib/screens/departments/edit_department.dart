import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/department_api.dart';
import '../../models/department.dart';
import '../../providers/department_provider.dart';
import '../../utilities/custom_validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_textformfield.dart';
import '../../widgets/show_loading.dart';

class EditDepartment extends StatefulWidget {
  const EditDepartment({required this.department, Key? key}) : super(key: key);
  final Department department;
  @override
  State<EditDepartment> createState() => _EditDepartmentState();
}

class _EditDepartmentState extends State<EditDepartment> {
  final TextEditingController _name = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  void initState() {
    _name.text = widget.department.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Department',
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
                readOnly: _isLoading,
                validator: (String? value) => CustomValidator.lessThen2(value),
              ),
              const SizedBox(height: 16),
              _isLoading
                  ? const ShowLoading()
                  : CustomElevatedButton(
                      title: 'Add Department'.toUpperCase(),
                      onTap: () async {
                        if (_key.currentState?.validate() ?? false) {
                          setState(() {
                            _isLoading = true;
                          });
                          final int _time =
                              DateTime.now().microsecondsSinceEpoch;
                          final bool _ok = await DepartmentAPI().add(Department(
                            id: widget.department.id,
                            name: _name.text.trim(),
                            createdBy: 'Me', //TODO: update pending
                            timestamp: _time,
                          ));

                          _name.text = '';
                          setState(() {
                            _isLoading = false;
                          });
                          if (_ok) {
                            Provider.of<DepartmentProvider>(context, listen: false)
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
