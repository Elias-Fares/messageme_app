import 'package:flutter/material.dart';
import 'package:message_me/core/appcolors.dart';

class RegisterBtn extends StatelessWidget {
  final void Function()? onPress ;
  final Color btnColor;
  final String title ;
  const RegisterBtn({
    super.key, this.onPress, required this.btnColor, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: btnColor,
      borderRadius: BorderRadius.circular(20),
      elevation: 5,
      child: MaterialButton(
        minWidth: 300,
        height: 55,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          title,
          style: TextStyle(fontSize: 20, color: AppColors.white),
        ),
        onPressed: onPress,
      ),
    );
  }
}
