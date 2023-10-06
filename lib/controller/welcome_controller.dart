import 'package:get/get.dart';

class WelcomeController extends GetxController{
  void  goToSignIn (){
    Get.toNamed("/signin");
  }
  void  goToRegister (){
    Get.toNamed("/register");
  }
}