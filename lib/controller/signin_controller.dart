import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  final _auth = FirebaseAuth.instance;
  String state = "";


  Future<void> signIn() async {
    try {
      state = "loading";
      update();
       await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      state = "done";
      update();
      Get.offNamed("/chatscreen");
        } catch (e, s) {
      print(e.runtimeType);
      print(s);
      print("=========== $e ===============");
      // print(s);
      state = "error";
      update();
      if (e is FirebaseAuthException) {
        Get.snackbar("INVALID", e.code,
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
