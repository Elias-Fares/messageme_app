import 'package:get/get.dart';
import 'package:message_me/view/auth/registeration.dart';
import 'package:message_me/view/auth/signin.dart';
import 'package:message_me/view/chat_screen/chat_screen.dart';
import 'package:message_me/view/welcome/welcome.dart';

// Map<String, Widget Function(BuildContext)> routes = {
//   "welcome" : (context) => Welcome(),
//   "sign_in" : (context) => SignIn(),
//   "register" : (context) => Register(),
//   "chat_screen" : (context) => ChatScreen(),
// };
List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const Welcome(),
      transition: Transition.leftToRight),
  GetPage(
      name: "/signin",
      page: () => const SignIn(),
      transition: Transition.leftToRight),
  GetPage(
      name: "/register",
      page: () => const Register(),
      transition: Transition.leftToRight),
  GetPage(
      name: "/chatscreen",
      page: () => const ChatScreen(),
      transition: Transition.leftToRight),
];
