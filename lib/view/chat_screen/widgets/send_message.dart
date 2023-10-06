import 'package:flutter/material.dart';
import 'package:message_me/core/appcolors.dart';

class SendMessage extends StatelessWidget {
  final TextEditingController controller ;
  final void Function()? onPressed;
  const SendMessage({
    super.key, required this.controller, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.transparentOrange,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                // onChanged: (value) {},
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  hintText: 'Write your message here...',
                  border: InputBorder.none,
                ),
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                'send',
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}