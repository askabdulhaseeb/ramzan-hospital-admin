import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/custom_validators.dart';
import '../../utilities/utilities.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    required TextEditingController controller,
    this.readOnly = false,
    this.textInputAction,
    this.hint = 'Password',
    Key? key,
  })  : _controller = controller,
        super(key: key);
  final TextEditingController _controller;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final String hint;
  @override
  PasswordTextFormFieldState createState() => PasswordTextFormFieldState();
}

class PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _notVisible = true;
  void _onListener() => setState(() {});
  @override
  void initState() {
    widget._controller.addListener(_onListener);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.removeListener(_onListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: widget._controller,
        obscureText: _notVisible,
        readOnly: widget.readOnly,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        cursorColor: Theme.of(context).colorScheme.secondary,
        validator: (String? value) => CustomValidator.password(value),
        decoration: InputDecoration(
          hintText: widget.hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          prefixIcon: const Icon(Icons.lock_open_rounded),
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              _notVisible = !_notVisible;
            }),
            splashRadius: Utilities.padding,
            icon: (_notVisible == true)
                ? const Icon(CupertinoIcons.eye)
                : const Icon(CupertinoIcons.eye_slash),
          ),
          focusColor: Theme.of(context).primaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
