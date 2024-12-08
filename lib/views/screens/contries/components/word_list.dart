import 'package:flutter/material.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';

import '../../../../models/bundles_card_model.dart';
import '../../../../utils/constants/appassets.dart';
import '../../../../utils/constants/appcolors.dart';
import '../../../../utils/constants/appfontsize.dart';
import '../../../widgets/bundles_card.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/locked_quiz_diaglog.dart';
import '../../../widgets/navigation_transition.dart';
import '../../../widgets/responsive_size.dart';
import '../../create quiz/create_quiz.dart';

// ignore: must_be_immutable
class ContriesWordList extends StatelessWidget {
  ContriesWordList({super.key});
  List<BundlesCardModel> wordlist = [
    BundlesCardModel(
        image: AppAssets.flagsUnlocked,
        title: 'Flags',
        subTitle: "Discover the stories and symbols behind the world's flags.",
        color: AppColors.purpleColor,
        isLocked: false),
    BundlesCardModel(
        image: AppAssets.foodUnlocked,
        title: 'Food',
        subTitle: 'Laugh, learn, and play with your beloved cartoon friends!',
        color: AppColors.redColor,
        isLocked: false),
    BundlesCardModel(
        image: AppAssets.flagsUnlocked,
        title: 'Famous Places',
        subTitle: 'Learn and have fun with exciting, interactive games.',
        color: AppColors.purpleColor,
        isLocked: false),
    BundlesCardModel(
        image: AppAssets.historyUnlocked,
        title: 'History',
        subTitle:
            'Explore the unique features and rich history of each country!',
        color: AppColors.brownColor,
        isLocked: false),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          40.height,
          BoldTextWidget(
            color: AppColors.title,
            fontSize: AppFontSize.sectiontitle,
            text: "Word List",
          ),
          20.height,
          ListView.builder(
            itemCount: wordlist.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            clipBehavior: Clip.none,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                    top: index == 0 ? 0 : ResponsiveSize.h * 15),
                child: GestureDetector(
                  onTap: wordlist[index].isLocked
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
                    cardColor: wordlist[index].color,
                    image: wordlist[index].image,
                    subtitle: wordlist[index].subTitle,
                    title: wordlist[index].title,
                  ),
                ),
              );
            },
          ),
          20.height,
        ],
      ),
    );
  }
}
