import 'package:flutter/material.dart';
import 'package:message_me/core/appcolors.dart';

class WelcomeBtn extends StatelessWidget {
  final void Function()? onPress ;
  final Color btnColor;
  final String title ;
  const WelcomeBtn({
    super.key, this.onPress, required this.btnColor, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: btnColor,
      borderRadius: BorderRadius.circular(20),
      elevation: 5,
      child: MaterialButton(
        minWidth: double.infinity,
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
