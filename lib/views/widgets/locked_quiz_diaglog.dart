import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/utils/constants/appassets.dart';
import 'package:quiz/utils/constants/appcolors.dart';
import 'package:quiz/views/widgets/custom_text.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';
import '../../utils/constants/appfontsize.dart';
import 'custom_button.dart';
import 'responsive_size.dart';

Future<void> lockedQuizDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Dialog.fullscreen(
              // elevation: 0,
              // clipBehavior: Clip.none,
              backgroundColor: Colors.transparent,
              child: Center(
                child: SizedBox(
                  height: ResponsiveSize.h * 500,
                  width: ResponsiveSize.w * 300,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: ResponsiveSize.h * 442,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.darkPurpleColor,
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Container(
                              height: ResponsiveSize.h * 442,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: AppColors.whiteColor,
                              ),
                              child: Column(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: ResponsiveSize.w * 30),
                                      child: Transform.translate(
                                        offset: const Offset(0, -1),
                                        child: Image.asset(
                                          AppAssets.lockedQuizDecorImg,
                                          height: ResponsiveSize.h * 50,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: ResponsiveSize.w * 30),
                                    child: Column(
                                      children: [
                                        25.height,
                                        BoldTextWidget(
                                          color: AppColors.title,
                                          fontSize: AppFontSize.sectiontitle +
                                              ResponsiveSize.setSp(2),
                                          text: "Electronics",
                                        ),
                                        15.height,
                                        MediumTextWidget(
                                          textAlign: TextAlign.center,
                                          color: AppColors.title,
                                          fontSize: AppFontSize.sectiontitle -
                                              ResponsiveSize.setSp(2),
                                          text:
                                              "Upgrade to our Electronic Premium Package and transform your everyday tech into a seamless, high-quality experience.",
                                        ),
                                        15.height,
                                        BoldTextWidget(
                                          color: AppColors.primaryColor,
                                          fontSize: AppFontSize.largetitle +
                                              ResponsiveSize.setSp(2),
                                          text: "\$90.00",
                                        ),
                                        30.height,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: ResponsiveSize.h * 30,
                        left: ResponsiveSize.w * 35,
                        right: ResponsiveSize.w * 35,
                        child: SecondaryButton(
                          centerContent: 'Buy Now',
                          ontap: () {
                            Get.back();
                          },
                        ),
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Transform.translate(
                            offset: Offset(0, ResponsiveSize.h * -50),
                            child: Image.asset(
                              AppAssets.premiumImage,
                              height: ResponsiveSize.h * 170,
                            ),
                          )),
                    ],
                  ),
                ),
              ));
        },
      );
    },
  );
}
