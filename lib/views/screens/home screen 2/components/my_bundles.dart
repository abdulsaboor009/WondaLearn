import 'package:flutter/material.dart';
import 'package:quiz/models/bundles_card_model.dart';
import 'package:quiz/utils/constants/appassets.dart';
import 'package:quiz/views/widgets/responsive_size.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';
import '../../../../utils/constants/appcolors.dart';
import '../../../../utils/constants/appfontsize.dart';
import '../../../widgets/bundles_card.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/locked_quiz_diaglog.dart';
import '../../../widgets/navigation_transition.dart';
import '../../create quiz/create_quiz.dart';
import '../../my bundles/my_bundles.dart';

// ignore: must_be_immutable
class HomeScreen2MyBundles extends StatelessWidget {
  HomeScreen2MyBundles({super.key});
  List<BundlesCardModel> myBundles = [
    BundlesCardModel(
        image: AppAssets.contriesUnlocked,
        isLocked: false,
        title: 'Countries',
        subTitle:
            'Explore the unique features and rich history of each country!',
        color: AppColors.darkGreenColor),
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
              text: "My Bundles",
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    RightToLeftTransition(MyBundlesScreen()));
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
          itemCount: myBundles.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          clipBehavior: Clip.none,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  EdgeInsets.only(top: index == 0 ? 0 : ResponsiveSize.h * 15),
              child: GestureDetector(
                onTap: myBundles[index].isLocked
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
                  cardColor: myBundles[index].color,
                  image: myBundles[index].image,
                  subtitle: myBundles[index].subTitle,
                  title: myBundles[index].title,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
