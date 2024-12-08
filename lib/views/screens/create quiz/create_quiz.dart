import 'package:flutter/material.dart';
import 'package:quiz/utils/constants/appassets.dart';
import 'package:quiz/utils/constants/appcolors.dart';
import 'package:quiz/views/screens/audio%20quiz/audio_quiz.dart';
import 'package:quiz/views/screens/word%20quiz/word_quiz.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';

import '../../../utils/constants/appfontsize.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/expantion_tile_widget.dart';
import '../../widgets/navigation_transition.dart';
import '../../widgets/responsive_size.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({super.key});

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  int selectedQuizType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurpleColor,
      body: Column(
        children: [
          55.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButtonWidget(),
                Padding(
                  padding: EdgeInsets.only(right: ResponsiveSize.w * 40),
                  child: BoldTextWidget(
                    color: AppColors.whiteTextColor,
                    fontSize: AppFontSize.screenTitle,
                    text: "Create Quiz",
                  ),
                ),
                const SizedBox()
              ],
            ),
          ),
          30.height,
          Expanded(
              child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppColors.whiteColor,
            ),
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: Container(
                    height: ResponsiveSize.h * 40,
                    width: ResponsiveSize.w * 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColor,
                    ),
                    child: Column(
                      children: [
                        5.height,
                        Container(
                          height: ResponsiveSize.h * 8,
                          width: ResponsiveSize.w * 8,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.darkGreenColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SemiBoldTextWidget(
                        color: AppColors.title,
                        fontSize:
                            AppFontSize.sectiontitle - ResponsiveSize.setSp(2),
                        text: "Number Of Questions",
                      ),
                      5.height,
                      ExpantionTileWidget(
                        list: List.generate(100, (index) => index + 1),
                        selectText: '1',
                      ),
                      20.height,
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedQuizType = 1;
                                });
                              },
                              child: Container(
                                height: ResponsiveSize.h * 165,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: selectedQuizType == 1
                                          ? AppColors.primaryColor
                                          : Colors.transparent,
                                      width: 1.5),
                                  color: AppColors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 4),
                                        color: const Color(0xff8D8D8D)
                                            .withOpacity(0.1),
                                        blurRadius: 25,
                                        spreadRadius: 0)
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.audioQuiz,
                                      height: ResponsiveSize.h * 70,
                                    ),
                                    10.height,
                                    SemiBoldTextWidget(
                                      color: AppColors.title,
                                      fontSize: AppFontSize.sectiontitle -
                                          ResponsiveSize.setSp(2),
                                      text: "Audio Quiz",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          18.width,
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedQuizType = 2;
                                });
                              },
                              child: Container(
                                height: ResponsiveSize.h * 165,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: selectedQuizType == 2
                                          ? AppColors.primaryColor
                                          : Colors.transparent,
                                      width: 1.5),
                                  color: AppColors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 4),
                                        color: const Color(0xff8D8D8D)
                                            .withOpacity(0.1),
                                        blurRadius: 25,
                                        spreadRadius: 0)
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.wordQuiz,
                                      height: ResponsiveSize.h * 70,
                                    ),
                                    10.height,
                                    SemiBoldTextWidget(
                                      color: AppColors.title,
                                      fontSize: AppFontSize.sectiontitle -
                                          ResponsiveSize.setSp(2),
                                      text: "Word Quiz",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenPadding,
                      vertical: ResponsiveSize.h * 20),
                  child: SecondaryButton(
                    centerContent: 'Create',
                    ontap: selectedQuizType == 1
                        ? () {
                            Navigator.push(
                                // ignore: use_build_context_synchronously
                                context,
                                BottomToTopTransition(const AudioQuizScreen()));
                          }
                        : () {
                            Navigator.push(
                                // ignore: use_build_context_synchronously
                                context,
                                BottomToTopTransition(const WordQuizScreen()));
                          },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
