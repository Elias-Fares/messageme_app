import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  final _auth = FirebaseAuth.instance;
  String state = "";

  void goToRegister() {
    Get.toNamed("/register");
  }

  Future<void> register() async {
    try {
      state = "loading";
      update();
      await _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      state = "done";
      update();
      Get.toNamed("/chatscreen");
    } catch (e, s) {
      print(e.runtimeType);
      print(s);
      print("=========== $e ===============");
      // print(s);
      state = "error";
      update();
      if (e is FirebaseAuthException) {
        Get.snackbar("INVALID", e.message.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    // print(email.value.toString());
    super.onInit();
  }
}
