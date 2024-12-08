import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../views/screens/home/home.dart';

class SignupController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final hidePassword1 = true.obs;
  final hidePassword2 = true.obs;
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
