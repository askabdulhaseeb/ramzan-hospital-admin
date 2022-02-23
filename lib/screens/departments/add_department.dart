import 'package:flutter/material.dart';

import '../../utilities/custom_validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_textformfield.dart';

class AddDepartment extends StatefulWidget {
  const AddDepartment({Key? key}) : super(key: key);
  static const String routeName = '/AddDepartment';
  @override
  State<AddDepartment> createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  final TextEditingController _name = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
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
              CustomElevatedButton(
                title: 'Add Department'.toUpperCase(),
                onTap: () {
                  if (_key.currentState?.validate() ?? false) {
                    
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
