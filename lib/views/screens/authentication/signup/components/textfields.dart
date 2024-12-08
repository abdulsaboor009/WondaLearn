import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';
import '../../../../../controllers/auth controller/signup_controller.dart';
import '../../../../../utils/constants/appcolors.dart';
import '../../../../../utils/constants/appfontsize.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/responsive_size.dart';

class SignupTextFieldsSection extends StatelessWidget {
  const SignupTextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
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
                    text: 'Create an account',
                  ),
                  SemiBoldTextWidget(
                    color: AppColors.subTitle,
                    fontSize:
                        AppFontSize.sectiontitle - ResponsiveSize.setSp(2),
                    text: "Connect with your friends today!",
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
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SemiBoldTextWidget(
                                color: AppColors.title,
                                fontSize: AppFontSize.sectiontitle -
                                    ResponsiveSize.setSp(2),
                                text: "Password",
                              ),
                              5.height,
                              customTextfield(
                                isobscure: controller.hidePassword1.value,
                                controller: controller.password,
                                hint: 'Enter Your Password',
                                suffixWidget: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: GestureDetector(
                                    onTap: () =>
                                        controller.hidePassword1.value =
                                            !controller.hidePassword1.value,
                                    child: Icon(
                                      controller.hidePassword1.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: AppColors.textFieldHintColor,
                                      size: ResponsiveSize.h * 22,
                                    ),
                                  ),
                                ),
                                onValidator: (value) =>
                                    Validator.validataEmptyText(
                                        'Password', value),
                              ),
                              20.height,
                              SemiBoldTextWidget(
                                color: AppColors.title,
                                fontSize: AppFontSize.sectiontitle -
                                    ResponsiveSize.setSp(2),
                                text: "Confirm Password",
                              ),
                              5.height,
                              customTextfield(
                                isobscure: controller.hidePassword2.value,
                                controller: controller.confirmPassword,
                                hint: 'Enter Your Password Again',
                                suffixWidget: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: GestureDetector(
                                    onTap: () =>
                                        controller.hidePassword2.value =
                                            !controller.hidePassword2.value,
                                    child: Icon(
                                      controller.hidePassword2.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: AppColors.textFieldHintColor,
                                      size: ResponsiveSize.h * 22,
                                    ),
                                  ),
                                ),
                                onValidator: (value) =>
                                    Validator.validataEmptyText(
                                        'Confirm Password', value),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  25.height,
                  SecondaryButton(
                    centerContent: 'Sign Up',
                    ontap: () => controller.emailAndPasswordSignIn(),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumTextWidget(
                        color: AppColors.title,
                        fontSize: AppFontSize.discription,
                        text: "Already have an account? ",
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: MediumTextWidget(
                          color: AppColors.primaryColor,
                          fontSize: AppFontSize.discription,
                          text: "Login",
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
