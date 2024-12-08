import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz/views/screens/home/home.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      Get.to(() => const HomeScreen());
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
