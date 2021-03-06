import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/utilities.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required TextEditingController controller,
    this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.hint = '',
    this.color,
    this.contentPadding,
    this.minLines = 1,
    this.maxLines = 1,
    this.showPrefixIcon = true,
    this.readOnly = false,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    Key? key,
  })  : _controller = controller,
        super(key: key);
  final TextEditingController _controller;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final bool showPrefixIcon;
  final String? Function(String? value)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final int? minLines;
  final int? maxLines;
  final Color? color;
  final String? initialValue;
  final String? hint;
  final bool readOnly;
  final bool autoFocus;
  final TextAlign textAlign;
  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  void _onListen() => setState(() {});
  @override
  void initState() {
    widget._controller.addListener(_onListen);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        initialValue: widget.initialValue,
        controller: widget._controller,
        readOnly: widget.readOnly,
        keyboardType: widget.maxLines! > 1
            ? TextInputType.multiline
            : widget.keyboardType ?? TextInputType.text,
        textInputAction: widget.maxLines! > 1
            ? TextInputAction.newline
            : widget.textInputAction ?? TextInputAction.next,
        autofocus: widget.autoFocus,
        textAlign: widget.textAlign,
        onChanged: widget.onChanged,
        minLines: widget.minLines,
        maxLines: (widget._controller.text.isEmpty) ? 1 : widget.maxLines,
        validator: (String? value) => widget.validator!(value),
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 12),
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon,
          suffixIcon: (widget._controller.text.isEmpty)
              ? const SizedBox(width: 0, height: 0)
              : (widget.showPrefixIcon == false)
                  ? const SizedBox(width: 0, height: 0)
                  : IconButton(
                      splashRadius: Utilities.padding,
                      onPressed: () => setState(() {
                        widget._controller.clear();
                      }),
                      icon: const Icon(CupertinoIcons.clear, size: 18),
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
