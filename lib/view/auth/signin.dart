import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_me/controller/signin_controller.dart';
import 'package:message_me/core/appcolors.dart';
import 'package:message_me/view/auth/widgets/custom_btn.dart';
import 'package:message_me/view/auth/widgets/custom_textfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController controller = Get.put(SignInController());
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                    Text(
                      "Sign In in MessageMe!",
                      style: TextStyle(
                          fontSize: 30,
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    RegisterTextfield(
                      hintText: 'Enter your Email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                      controller: controller.email,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    RegisterTextfield(
                      hintText: 'Enter your Password',
                      isPassword: true,
                      prefixIcon: Icon(
                        Icons.lock_open_outlined,
                      ),
                      controller: controller.password,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    RegisterBtn(
                      btnColor: AppColors.darkBlue,
                      title: "Sign In",
                      onPress: () {
                        print(controller.email.text);
                        print(controller.password.text);
                        controller.signIn();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          GetBuilder<SignInController>(
            builder: (controller) => controller.state == "loading"
                ? BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 8,
                    sigmaY: 8
                  ),
                  child: CircularProgressIndicator(
                      color: AppColors.darkBlue,
                    ),
                )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
