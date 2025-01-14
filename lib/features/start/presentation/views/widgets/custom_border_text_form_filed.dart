import 'package:flutter/material.dart';
import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/utils/styles.dart';

class CustomBorderTextFormFiled extends StatelessWidget {
  const CustomBorderTextFormFiled({
    super.key,
    required this.onSaved,
    required this.hintText,
    required this.type,
    this.icon,
  });
  final void Function(String?) onSaved;
  final String hintText;
  final String type;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:
          type == "number" ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "This Field is Required";
        } else if (type == "number" && !isNumeric(value!)) {
          return "Please enter a valid number";
        } else if (type == "email" && !isEmail(value!)) {
          return "Please enter a valid email";
        } else if (type == "name" && !isName(value!)) {
          return "Please enter a valid name";
        } else {
          return null;
        }
      },
      obscureText: type == "password",
      onSaved: onSaved,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: kSecondaryColor,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 16,
        ),
        hintStyle: Styles.styleText14.copyWith(color: Colors.white),
        prefixIcon: icon != null ? Icon(icon, color: Colors.white) : null,
        prefixIconColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kSpecialColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kSpecialColor,
          ),
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  bool isNumeric(String str) {
    try {
      double.parse(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isEmail(String value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(value);
  }

  bool isName(String value) {
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    return nameRegex.hasMatch(value);
  }
}
