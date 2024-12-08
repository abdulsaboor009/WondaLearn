import 'package:flutter/material.dart';
import 'package:quiz/views/screens/create%20quiz/create_quiz.dart';
import '../../../models/bundles_card_model.dart';
import '../../../utils/constants/appassets.dart';
import '../../../utils/constants/appcolors.dart';
import '../../../utils/constants/appfontsize.dart';
import '../../widgets/back_button.dart';
import '../../widgets/bundles_card.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/locked_quiz_diaglog.dart';
import '../../widgets/navigation_transition.dart';
import '../../widgets/responsive_size.dart';
import '../../widgets/sizedbox_extention.dart';

// ignore: must_be_immutable
class MyBundlesScreen extends StatelessWidget {
  MyBundlesScreen({super.key});
  List<BundlesCardModel> bundles = [
    BundlesCardModel(
        image: AppAssets.contriesUnlocked,
        isLocked: false,
        title: 'Countries',
        subTitle:
            'Explore the unique features and rich history of each country!',
        color: AppColors.darkGreenColor),
    BundlesCardModel(
        image: AppAssets.cartoonLocked,
        title: 'Cartoon',
        subTitle: 'Laugh, learn, and play with your beloved cartoon friends!',
        color: AppColors.blueColor,
        isLocked: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                AppAssets.homeDecorImg,
                height: ResponsiveSize.h * 180,
              ),
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenPadding),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      55.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BackButtonWidget(),
                          Padding(
                            padding:
                                EdgeInsets.only(right: ResponsiveSize.w * 40),
                            child: BoldTextWidget(
                              color: AppColors.title,
                              fontSize: AppFontSize.screenTitle,
                              text: "Bundles",
                            ),
                          ),
                          const SizedBox()
                        ],
                      ),
                      40.height,
                      ListView.builder(
                        itemCount: bundles.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        clipBehavior: Clip.none,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: index == 0 ? 0 : ResponsiveSize.h * 15),
                            child: GestureDetector(
                              onTap: bundles[index].isLocked
                                  ? () {
                                      lockedQuizDialog(context);
                                    }
                                  : () {
                                      Navigator.push(
                                          // ignore: use_build_context_synchronously
                                          context,
                                          BottomToTopTransition(
                                              const CreateQuizScreen()));
                                    },
                              child: BundlesCard(
                                cardColor: bundles[index].color,
                                image: bundles[index].image,
                                subtitle: bundles[index].subTitle,
                                title: bundles[index].title,
                              ),
                            ),
                          );
                        },
                      ),
                      20.height,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
