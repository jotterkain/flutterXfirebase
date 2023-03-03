import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final Widget? label;
  final bool? readOnly;
  final String? initialValue;
  final TextEditingController controller;
  final void Function()? onTap;
  final void Function(PointerDownEvent pointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final AutovalidateMode? autoValidateMode;
  final int? maxLength;

  const CustomField({Key? key,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.label,
    this.readOnly,
    required this.controller,
    this.initialValue,
    this.onTap,
    this.onTapOutside,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted, this.obscureText, this.autoValidateMode, this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLength: maxLength,
      validator: validator,
      onTapOutside: onTapOutside,
      initialValue: initialValue,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: autoValidateMode,
      controller: controller,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        label: label,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
