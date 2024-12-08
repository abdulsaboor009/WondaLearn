import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/views/screens/authentication/signup/signup.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';

import '../../../../../controllers/auth controller/login_controller.dart';
import '../../../../../utils/constants/appcolors.dart';
import '../../../../../utils/constants/appfontsize.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/navigation_transition.dart';
import '../../../../widgets/responsive_size.dart';

class LoginTextFieldsSection extends StatelessWidget {
  const LoginTextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Expanded(
      child: Transform.translate(
        offset: const Offset(0, -25),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveSize.w * 20,
                  vertical: ResponsiveSize.h * 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldTextWidget(
                    color: AppColors.title,
                    fontSize: AppFontSize.largetitle - ResponsiveSize.setSp(2),
                    text: 'Welcome Back',
                  ),
                  SemiBoldTextWidget(
                    color: AppColors.subTitle,
                    fontSize:
                        AppFontSize.sectiontitle - ResponsiveSize.setSp(2),
                    text: "Hello again, you've missed!",
                  ),
                  35.height,
                  Form(
                    key: controller.loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SemiBoldTextWidget(
                          color: AppColors.title,
                          fontSize: AppFontSize.sectiontitle -
                              ResponsiveSize.setSp(2),
                          text: "Email",
                        ),
                        5.height,
                        customTextfield(
                          controller: controller.email,
                          onValidator: (value) =>
                              Validator.validateEmail(value),
                          hint: 'Enter Your Email',
                        ),
                        20.height,
                        SemiBoldTextWidget(
                          color: AppColors.title,
                          fontSize: AppFontSize.sectiontitle -
                              ResponsiveSize.setSp(2),
                          text: "Password",
                        ),
                        5.height,
                        Obx(
                          () => customTextfield(
                            isobscure: controller.hidePassword.value,
                            controller: controller.password,
                            hint: 'Enter Your Password',
                            suffixWidget: Padding(
                              padding: const EdgeInsets.all(12),
                              child: GestureDetector(
                                onTap: () => controller.hidePassword.value =
                                    !controller.hidePassword.value,
                                child: Icon(
                                  controller.hidePassword.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: AppColors.textFieldHintColor,
                                  size: ResponsiveSize.h * 22,
                                ),
                              ),
                            ),
                            onValidator: (value) =>
                                Validator.validataEmptyText('Password', value),
                          ),
                        ),
                      ],
                    ),
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: SemiBoldTextWidget(
                            color: AppColors.redColor,
                            fontSize: AppFontSize.discription,
                            text: "Forgot Password ?",
                          ))
                    ],
                  ),
                  25.height,
                  SecondaryButton(
                    centerContent: 'Log In',
                    ontap: () => controller.emailAndPasswordSignIn(),
                  ),
                  80.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumTextWidget(
                        color: AppColors.title,
                        fontSize: AppFontSize.discription,
                        text: "Don’t have an account?",
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              RightToLeftTransition(const SignupScreen()));
                        },
                        child: MediumTextWidget(
                          color: AppColors.primaryColor,
                          fontSize: AppFontSize.discription,
                          text: "Sign up",
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
