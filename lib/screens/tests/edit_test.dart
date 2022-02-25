import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/test_api.dart';
import '../../models/lab_test.dart';
import '../../providers/test_provider.dart';
import '../../utilities/custom_validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_textformfield.dart';
import '../../widgets/show_loading.dart';

class EditTest extends StatefulWidget {
  const EditTest({required this.test, Key? key}) : super(key: key);
  final LabTest test;
  @override
  State<EditTest> createState() => _EditTestState();
}

class _EditTestState extends State<EditTest> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _fee = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    _name.text = widget.test.name;
    _fee.text = widget.test.fee.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Test',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              CustomTextFormField(
                controller: _name,
                hint: 'Test Name',
                readOnly: _isLoading,
                autoFocus: true,
                validator: (String? value) => CustomValidator.lessThen2(value),
              ),
              CustomTextFormField(
                controller: _fee,
                hint: 'Test Fee',
                readOnly: _isLoading,
                keyboardType: TextInputType.number,
                validator: (String? value) => CustomValidator.isEmpty(value),
              ),
              const SizedBox(height: 10),
              _isLoading
                  ? const ShowLoading()
                  : CustomElevatedButton(
                      title: 'Add Test'.toUpperCase(),
                      onTap: () async {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          final LabTest _labtest = LabTest(
                            id: widget.test.id,
                            name: _name.text.trim(),
                            fee: double.parse(_fee.text),
                          );
                          final bool _ok = await TestAPI().addTest(_labtest);
                          if (_ok) {
                            Provider.of<TestProvider>(context, listen: false)
                                .refresh();
                            Navigator.of(context).pop();
                          } else {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
