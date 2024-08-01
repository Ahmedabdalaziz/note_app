import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Color color;
  final Function(String)? onChange;
  final String? labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final IconData? icon;
  final IconButton? suffixIcon;
  final double? borderCircular;
  final Function(String)? onSubmitted;
  final int maxLines;
  final FocusNode? focusNode;
  final Function(String?)? onSaved;

  const CustomTextField({
    super.key,
    required this.color,
    this.labelText,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.icon,
    this.onChange,
    this.suffixIcon,
    this.onSubmitted,
    this.borderCircular = 10,
    this.maxLines = 1,
    this.focusNode,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      maxLines: maxLines,
      onFieldSubmitted: onSubmitted,
      onChanged: onChange,
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: color, fontSize: 18),
      validator: validator,
      keyboardType: keyboardType,
      focusNode: focusNode,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: TextStyle(color: color),
        prefixIcon: Icon(icon, color: color),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderCircular!),
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderCircular!),
          borderSide: BorderSide(color: color),
        ),
      ),
    );
  }
}
