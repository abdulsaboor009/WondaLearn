import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/utils/constants/appcolors.dart';
import 'package:quiz/views/widgets/responsive_size.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: ResponsiveSize.h * 37,
        width: ResponsiveSize.w * 37,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 1),
                  color: AppColors.blackColor.withOpacity(0.09),
                  blurRadius: 4,
                  spreadRadius: 0)
            ]),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_rounded,
            size: ResponsiveSize.h * 20,
            color: AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
