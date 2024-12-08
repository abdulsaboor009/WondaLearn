import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:quiz/utils/constants/appassets.dart';
import 'package:quiz/utils/constants/appcolors.dart';
import 'package:quiz/views/screens/home/home.dart';
import 'package:quiz/views/widgets/custom_text.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';
import '../../utils/constants/appfontsize.dart';
import 'custom_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'responsive_size.dart';

Future<void> showQuizResultDiaglog(BuildContext context) {
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
                  height: ResponsiveSize.h * 455,
                  width: ResponsiveSize.w * 300,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: ResponsiveSize.h * 343,
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
                                          horizontal: ResponsiveSize.w * 26),
                                      child: Transform.translate(
                                        offset: const Offset(0, -1),
                                        child: SizedBox(
                                          height: ResponsiveSize.h * 50,
                                          width: double.infinity,
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                AppAssets.lockedQuizDecorImg,
                                                height: ResponsiveSize.h * 50,
                                                width: double.infinity,
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          ResponsiveSize.h * 5),
                                                  child: BoldTextWidget(
                                                    color: AppColors
                                                        .whiteTextColor,
                                                    fontSize: AppFontSize
                                                        .sectiontitle,
                                                    text: "Congratulations",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                                        Transform.scale(
                                          scale: 1.2,
                                          child: RatingBar.builder(
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            ignoreGestures: true,
                                            allowHalfRating: true,
                                            updateOnDrag: false,
                                            tapOnlyMode: false,
                                            itemCount: 5,
                                            itemSize: ResponsiveSize.h * 40,
                                            itemBuilder: (context, _) =>
                                                const Icon(Icons.star_rounded,
                                                    color:
                                                        AppColors.yellowColor),
                                            onRatingUpdate: (rating) {},
                                            unratedColor:
                                                const Color(0xffDADADA),
                                          ),
                                        ),
                                        8.height,
                                        BoldTextWidget(
                                          color: AppColors.yellowColor,
                                          fontSize: AppFontSize.discription +
                                              ResponsiveSize.setSp(2),
                                          text: "3 STARS",
                                        ),
                                        15.height,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BoldTextWidget(
                                              color: AppColors.redColor,
                                              fontSize: AppFontSize.largetitle,
                                              text: 'Your Score',
                                            ),
                                            5.width,
                                            BoldTextWidget(
                                              color: AppColors.primaryColor,
                                              fontSize: AppFontSize.largetitle +
                                                  ResponsiveSize.setSp(4),
                                              text: '150',
                                            ),
                                          ],
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
                        left: ResponsiveSize.w * 26,
                        right: ResponsiveSize.w * 26,
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 5),
                                        color: const Color(0xff000000)
                                            .withOpacity(0.08),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                      )
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  child: NiceButtons(
                                    startColor: AppColors.primaryColor,
                                    endColor: AppColors.primaryColor,
                                    borderColor:
                                        const Color.fromARGB(255, 80, 116, 18)
                                            .withOpacity(0.50),
                                    borderRadius: 10,
                                    stretch: false,
                                    height: 50,
                                    onTap: (finish) {
                                      Timer(const Duration(milliseconds: 200),
                                          () {
                                        Get.offAll(() => const HomeScreen());
                                      });
                                    },
                                    width: 65,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          AppAssets.home,
                                          height: ResponsiveSize.h * 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            10.width,
                            Expanded(
                              child: SecondaryButton(
                                height: 50,
                                centerContent: 'Play Again',
                                ontap: () {
                                  Get.offAll(() => const HomeScreen());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Transform.translate(
                            offset: Offset(ResponsiveSize.w * 15, 3),
                            child: Image.asset(
                              AppAssets.loginSignupImg,
                              height: ResponsiveSize.h * 150,
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
