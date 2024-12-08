import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:quiz/utils/constants/appfontsize.dart';
import '../../utils/constants/appcolors.dart';
import 'custom_text.dart';

class SecondaryButton extends StatelessWidget {
  final double height;
  final VoidCallback? ontap;
  final String centerContent;
  final Color buttonColor, borderColor;
  const SecondaryButton(
      {super.key,
      this.ontap,
      required this.centerContent,
      this.height = 54,
      this.buttonColor = AppColors.primaryColor,
      this.borderColor = const Color.fromARGB(255, 80, 116, 18)});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: const Color(0xff000000).withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 0,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: NiceButtons(
          startColor: buttonColor,
          endColor: buttonColor,
          borderColor: borderColor.withOpacity(0.50),
          borderRadius: 12,
          stretch: true,
          height: height,
          onTap: (finish) {
            Timer(const Duration(milliseconds: 200), () {
              ontap!();
            });
          },
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: BoldTextWidget(
                  fontSize: AppFontSize.buttonText,
                  text: centerContent,
                  color: AppColors.whiteTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
