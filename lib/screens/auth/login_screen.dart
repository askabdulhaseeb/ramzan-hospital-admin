import 'package:flutter/material.dart';
import '../../utilities/custom_validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_password_textformfield.dart';
import '../../widgets/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
              'SIGN IN',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              controller: _email,
              hint: 'example@mail.com',
              prefixIcon: const Icon(Icons.mail_outline),
              validator: (String? value) => CustomValidator.email(value),
            ),
            PasswordTextFormField(controller: _password),
            const SizedBox(height: 16),
            CustomElevatedButton(
              title: 'Sign IN'.toUpperCase(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
