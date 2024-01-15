import 'package:flutter/material.dart';
import 'package:baby_countdown/core.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.minLines = 1,
    required this.onChanged,
    required this.onSaved,
  });

  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        labelText: labelText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        focusColor: primaryColor.shade500,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: primaryColor.shade600,
          ),
        ),
      ),
      style: Theme.of(context).textTheme.titleMedium,
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: null,
      minLines: minLines,
      validator: validator,
    );
  }
}
