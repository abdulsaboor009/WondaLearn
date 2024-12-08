import 'package:flutter/material.dart';
import 'package:quiz/models/bundles_card_model.dart';
import 'package:quiz/utils/constants/appassets.dart';
import 'package:quiz/views/screens/bundles/bundles.dart';
import 'package:quiz/views/screens/create%20quiz/create_quiz.dart';
import 'package:quiz/views/widgets/locked_quiz_diaglog.dart';
import 'package:quiz/views/widgets/responsive_size.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';
import '../../../../utils/constants/appcolors.dart';
import '../../../../utils/constants/appfontsize.dart';
import '../../../widgets/bundles_card.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/navigation_transition.dart';

// ignore: must_be_immutable
class HomeBundles extends StatelessWidget {
  HomeBundles({super.key});
  List<BundlesCardModel> bundles = [
    BundlesCardModel(
        image: AppAssets.contriesUnlocked,
        title: 'Countries',
        subTitle:
            'Explore the unique features and rich history of each country!',
        color: AppColors.darkGreenColor,
        isLocked: false),
    BundlesCardModel(
        image: AppAssets.gamesLocked,
        title: 'Games',
        subTitle: 'Learn and have fun with exciting, interactive games.',
        color: AppColors.orangeColor,
        isLocked: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoldTextWidget(
              color: AppColors.title,
              fontSize: AppFontSize.sectiontitle,
              text: "Bundles",
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    RightToLeftTransition(BundlesScreen()));
              },
              child: Row(
                children: [
                  MediumTextWidget(
                    color: AppColors.title,
                    fontSize: AppFontSize.discription,
                    text: "Show all",
                  ),
                  Icon(
                    Icons.arrow_right,
                    size: ResponsiveSize.h * 22,
                    color: AppColors.title,
                  )
                ],
              ),
            )
          ],
        ),
        10.height,
        ListView.builder(
          itemCount: bundles.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          clipBehavior: Clip.none,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  EdgeInsets.only(top: index == 0 ? 0 : ResponsiveSize.h * 15),
              child: GestureDetector(
                onTap: bundles[index].isLocked
                    ? () {
                        lockedQuizDialog(context);
                      }
                    : () {
                        Navigator.push(
                            // ignore: use_build_context_synchronously
                            context,
                            BottomToTopTransition(const CreateQuizScreen()));
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
      ],
    );
  }
}
