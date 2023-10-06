import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:message_me/controller/welcome_controller.dart';
import 'package:message_me/core/appcolors.dart';
import 'package:message_me/view/welcome/widgets/welcomebtn.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    WelcomeController controller = Get.put(WelcomeController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              Text(
                "MessageMe",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkBlue),
              ),
              WelcomeBtn(
                  btnColor: AppColors.orange,
                  title: 'Sign in',
                  onPress: () {
                    controller.goToSignIn();
                  }),
              WelcomeBtn(
                  btnColor: AppColors.darkBlue,
                  title: 'Register',
                  onPress: () {
                    controller.goToRegister();
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
