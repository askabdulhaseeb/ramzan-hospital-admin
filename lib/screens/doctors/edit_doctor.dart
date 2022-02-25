import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../database/user_api.dart';
import '../../enums/user_type_enum.dart';
import '../../functions/image_functions.dart';
import '../../models/app_user.dart';
import '../../models/department.dart';
import '../../providers/department_provider.dart';
import '../../providers/user_provider.dart';
import '../../utilities/custom_validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_file_image_box.dart';
import '../../widgets/custom_textformfield.dart';
import '../../widgets/deopdowns/department_dropdown.dart';
import '../../widgets/show_loading.dart';

class EditDoctor extends StatefulWidget {
  const EditDoctor({required this.doctor, Key? key}) : super(key: key);
  final AppUser doctor;
  @override
  State<EditDoctor> createState() => _EditDoctorState();
}

class _EditDoctorState extends State<EditDoctor> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _fee = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isLoadiing = false;
  String _departmentId = '';
  XFile? _file;

  @override
  void initState() {
    _name.text = widget.doctor.name ?? '';
    _email.text = widget.doctor.email ?? '';
    _phoneNumber.text = widget.doctor.phoneNumber ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Doctor',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: <Widget>[
                CustomFileImageBox(
                  file: _file,
                  onTap: () async {
                    _file = await ImageFunctions().imageFromGalary();
                    setState(() {});
                  },
                ),
                CustomTextFormField(
                  controller: _name,
                  hint: 'Doctor Name',
                  validator: (String? value) =>
                      CustomValidator.lessThen3(value),
                  readOnly: _isLoadiing,
                ),
                Consumer<DepartmentProvider>(
                  builder: (_, DepartmentProvider depProvider, __) =>
                      DepartmentDropdown(
                    selectedItem: depProvider.department(
                        id: widget.doctor.departments?[0] ?? ''),
                    items: depProvider.departments,
                    onChanged: (Department? newSelection) {
                      _departmentId = newSelection?.id ?? '';
                    },
                  ),
                ),
                CustomTextFormField(
                  controller: _email,
                  hint: 'email@email.com',
                  validator: (String? value) => CustomValidator.email(value),
                  readOnly: _isLoadiing,
                ),
                Row(
                  children: <Widget>[
                    const Text(
                      '+92',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: CustomTextFormField(
                        controller: _phoneNumber,
                        hint: '345 1234567',
                        keyboardType: TextInputType.number,
                        validator: (String? value) =>
                            CustomValidator.phoneNumber(value),
                        readOnly: _isLoadiing,
                      ),
                    ),
                  ],
                ),
                _isLoadiing
                    ? const ShowLoading()
                    : CustomElevatedButton(
                        title: 'Add Doctor'.toUpperCase(),
                        onTap: () async {
                          if (_key.currentState?.validate() ?? false) {
                            setState(() {
                              _isLoadiing = true;
                            });
                            AppUser _user = AppUser(
                              uid: widget.doctor.uid,
                              name: _name.text,
                              departments: <String>[_departmentId],
                              email: _email.text,
                              phoneNumber: _phoneNumber.text,
                              type: UserTypeEnum.DOCTOR,
                            );
                            final bool _ok = await UserAPI().addUser(_user);
                            if (_ok) {
                              Provider.of<UserProvider>(context, listen: false)
                                  .refresh();
                              Navigator.of(context).pop();
                            } else {
                              setState(() {
                                _isLoadiing = false;
                              });
                            }
                          }
                        },
                      ),
                const SizedBox(height: 700),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
