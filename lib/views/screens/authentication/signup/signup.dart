import 'package:flutter/material.dart';
import 'package:quiz/views/screens/authentication/signup/components/textfields.dart';

import '../../../../utils/constants/appassets.dart';
import '../../../widgets/responsive_size.dart';
import '../common components/header.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            const SizedBox(
              child: Column(
                children: [
                  LoginSignupHeaderSection(
                    title: 'Sign Up',
                  ),
                  SignupTextFieldsSection()
                ],
              ),
            ),
            Positioned(
                right: 30,
                top: ResponsiveSize.h * 50,
                child: Image.asset(
                  AppAssets.loginSignupImg,
                  height: ResponsiveSize.h * 160,
                )),
          ],
        ),
      ),
    );
  }
}
