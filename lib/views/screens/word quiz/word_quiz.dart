import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/utils/constants/appfontsize.dart';
import 'package:quiz/views/widgets/custom_button.dart';
import 'package:quiz/views/widgets/custom_text.dart';
import '../../../utils/constants/appassets.dart';
import '../../../utils/constants/appcolors.dart';
import '../../widgets/responsive_size.dart';
import '../../widgets/result_diaglog.dart';
import '../../widgets/sizedbox_extention.dart';

class WordQuizScreen extends StatefulWidget {
  const WordQuizScreen({super.key});

  @override
  State<WordQuizScreen> createState() => _WordQuizScreenState();
}

class _WordQuizScreenState extends State<WordQuizScreen> {
  double containerWidth = 40;
  int currentStep = 1;

  late PageController _pageController;

  // void moveToNextStep() {
  //   setState(() {
  //     if (currentStep < 7) {
  //       currentStep++;
  //       containerWidth =
  //           (MediaQuery.of(context).size.width - 40) * (currentStep / 7);
  //       _pageController.animateToPage(
  //         currentStep - 1,
  //         duration: const Duration(milliseconds: 800),
  //         curve: Curves.easeInOut,
  //       );
  //     }
  //   });
  // }
  void moveToNextStep() {
    setState(() {
      if (currentStep < 7) {
        currentStep++;
        containerWidth =
            (MediaQuery.of(context).size.width - 40) * (currentStep / 7);
        _pageController.animateToPage(
          currentStep - 1,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      } else {
        // Show the result dialog when the user reaches step 7
        showQuizResultDiaglog(context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  List<String> question = [
    AppAssets.girl,
    AppAssets.clock,
    AppAssets.cap,
    AppAssets.brain,
  ];
  int selectedAnswer = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            55.height,
            SizedBox(
              height: ResponsiveSize.h * 18,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenPadding),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: ResponsiveSize.w * 30),
                      height: ResponsiveSize.h * 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.lightGreyColor),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                              height: ResponsiveSize.h * 18,
                              width: containerWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.yellowColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Transform.scale(
                        scale: 1.5,
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            AppAssets.close,
                            height: ResponsiveSize.h * 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            25.height,
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: currentStep,
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenPadding + ResponsiveSize.w * 10),
                      child: Column(
                        children: [
                          60.height,
                          BoldTextWidget(
                            color: AppColors.title,
                            fontSize: ResponsiveSize.setSp(34),
                            text: 'Girl',
                          ),
                          60.height,
                          GridView.builder(
                            clipBehavior: Clip.none,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: ResponsiveSize.h * 140,
                                    crossAxisSpacing: ResponsiveSize.w * 20,
                                    mainAxisSpacing: ResponsiveSize.h * 20),
                            itemCount: question.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    selectedAnswer = index;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 4),
                                            spreadRadius: 0,
                                            blurRadius: 24,
                                            color:
                                                Colors.black.withOpacity(0.1))
                                      ]),
                                  height: ResponsiveSize.h * 140,
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        child: Center(
                                            child: Image.asset(
                                          question[index],
                                          height: ResponsiveSize.h * 70,
                                        )),
                                      ),
                                      selectedAnswer == index
                                          ? Positioned(
                                              right: ResponsiveSize.w * 15,
                                              top: ResponsiveSize.h * 15,
                                              child: Image.asset(
                                                AppAssets.selected,
                                                height: ResponsiveSize.h * 20,
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          50.height,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            actionButtons(),
          ],
        ),
      ),
    );
  }

  Widget actionButtons() {
    return Column(
      children: [
        if (selectedAnswer == 0) // First index selected
          Container(
            height: ResponsiveSize.h * 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primaryColor.withOpacity(.2),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.height,
                  SemiBoldTextWidget(
                    color: AppColors.primaryColor,
                    fontSize:
                        AppFontSize.sectiontitle + ResponsiveSize.setSp(2),
                    text: 'Amazing!',
                  ),
                  6.height,
                  Row(
                    children: [
                      SemiBoldTextWidget(
                        color: AppColors.primaryColor,
                        fontSize:
                            AppFontSize.discription + ResponsiveSize.setSp(1),
                        text: 'Answer:',
                      ),
                      10.width,
                      Image.asset(
                        question[0],
                        height: ResponsiveSize.h * 25,
                      )
                    ],
                  ),
                  16.height,
                  SecondaryButton(
                    centerContent: 'Next',
                    buttonColor: const Color(0xff8BE969),
                    ontap: () {
                      if (currentStep <= 7) {
                        setState(() {
                          moveToNextStep();
                        });
                      }
                    },
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        if (selectedAnswer > 0) // Any index except the first one
          Container(
            height: ResponsiveSize.h * 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.redColor.withOpacity(.2),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.height,
                  SemiBoldTextWidget(
                    color: AppColors.redColor,
                    fontSize:
                        AppFontSize.sectiontitle + ResponsiveSize.setSp(2),
                    text: 'Oops Wrong!',
                  ),
                  6.height,
                  Row(
                    children: [
                      SemiBoldTextWidget(
                        color: AppColors.redColor,
                        fontSize:
                            AppFontSize.discription + ResponsiveSize.setSp(1),
                        text: 'Answer:',
                      ),
                      10.width,
                      Image.asset(
                        question[0],
                        height: ResponsiveSize.h * 25,
                      )
                    ],
                  ),
                  16.height,
                  SecondaryButton(
                    centerContent: 'Next',
                    buttonColor: AppColors.redColor,
                    borderColor: const Color(0xffFF4B4C),
                    ontap: () {
                      if (currentStep <= 7) {
                        setState(() {
                          moveToNextStep();
                        });
                      }
                    },
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        if (selectedAnswer == -1) // No selection yet
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenPadding, vertical: ResponsiveSize.h * 20),
            child: SecondaryButton(
              centerContent: 'Next',
              buttonColor: const Color(0xff8BE969),
              ontap: () {
                if (currentStep <= 7) {
                  setState(() {
                    moveToNextStep();
                  });
                }
              },
            ),
          ),
      ],
    );
  }
}
