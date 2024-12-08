import 'package:flutter/material.dart';
import 'package:quiz/views/screens/home%20screen%202/home_screen2.dart';
import 'package:quiz/views/widgets/custom_text.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';
import '../../../../utils/constants/appcolors.dart';
import '../../../../utils/constants/appfontsize.dart';
import '../../../widgets/activity_card.dart';
import '../../../widgets/navigation_transition.dart';

class HomeFreeWorldList extends StatelessWidget {
  const HomeFreeWorldList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.height,
        BoldTextWidget(
          color: AppColors.title,
          fontSize: AppFontSize.sectiontitle,
          text: "Enjoy Free Wold List",
        ),
        20.height,
        Row(
          children: [
            Expanded(
              child: ActivityCard(
                ontap: () {
                  Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      BottomToTopTransition(const HomeScreen2()));
                },
                title: 'Flags',
                cardColor: AppColors.purpleColor,
              ),
            ),
            16.width,
            Expanded(
              child: ActivityCard(
                ontap: () {
                  Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      BottomToTopTransition(const HomeScreen2()));
                },
                title: 'Food',
                cardColor: AppColors.redColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
