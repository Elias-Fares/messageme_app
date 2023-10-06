import 'package:flutter/material.dart';
import 'package:message_me/core/appcolors.dart';

class RegisterTextfield extends StatelessWidget {
  final String hintText;
  final bool? isPassword;
  final Icon prefixIcon;
  final TextEditingController controller;
  const RegisterTextfield({
    super.key,
    required this.hintText,
    this.isPassword,
    required this.prefixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.darkBlue,
      obscureText: isPassword == null ? false : isPassword!,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.focused)) {
            return AppColors.darkBlue;
          }
          return AppColors.orange;
        }),
        hintText: hintText,
        focusColor: AppColors.darkBlue,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.orange, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.darkBlue, width: 2)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
