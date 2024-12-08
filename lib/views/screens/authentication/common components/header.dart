import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/utils/constants/appcolors.dart';
import 'package:quiz/utils/constants/appfontsize.dart';
import 'package:quiz/views/widgets/custom_text.dart';
import 'package:quiz/views/widgets/responsive_size.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';

class LoginSignupHeaderSection extends StatelessWidget {
  final String title;
  final bool showBackButton;
  const LoginSignupHeaderSection(
      {super.key, required this.title, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      height: ResponsiveSize.h * 200,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: ResponsiveSize.w * screenPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.height,
                showBackButton
                    ? InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: ResponsiveSize.h * 38,
                          width: ResponsiveSize.w * 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.whiteColor.withOpacity(0.30)),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: AppColors.whiteColor,
                              size: ResponsiveSize.h * 17,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: ResponsiveSize.h * 38,
                        width: ResponsiveSize.w * 38,
                      ),
                20.height,
                BoldTextWidget(
                  color: AppColors.whiteTextColor,
                  fontSize: AppFontSize.largetitle,
                  text: title,
                )
              ],
            ),
          ),
          Stack(
            children: [
              Positioned(
                right: 30,
                top: -20,
                child: Container(
                  height: ResponsiveSize.h * 140,
                  width: ResponsiveSize.w * 140,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColor.withOpacity(0.20)),
                ),
              ),
              Positioned(
                right: -40,
                top: -10,
                child: Container(
                  height: ResponsiveSize.h * 140,
                  width: ResponsiveSize.w * 140,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColor.withOpacity(0.20)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
