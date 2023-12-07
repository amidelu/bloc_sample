import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.textEditingController, this.hintText, this.initialValue, required this.isDone, this.labelText, this.isObscure, this.isEnabled, this.maxLines, this.textInputType, this.validator, this.onSaved});

  final TextEditingController? textEditingController;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final bool isDone;
  final bool? isObscure;
  final bool? isEnabled;
  final int? maxLines;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        controller: textEditingController,
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(10.0),
        ),
        enabled: isEnabled ?? true,
        maxLines: maxLines,
        textInputAction: isDone ? TextInputAction.done : TextInputAction.next,
        obscureText: isObscure ?? false,
        keyboardType: textInputType ?? TextInputType.text,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
