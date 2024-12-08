import 'package:flutter/material.dart';
import 'package:quiz/views/widgets/activity_card.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';

import '../../../../utils/constants/appcolors.dart';
import '../../../../utils/constants/appfontsize.dart';
import '../../../widgets/custom_text.dart';

class HomeScreen2LastActivity extends StatelessWidget {
  const HomeScreen2LastActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.height,
        BoldTextWidget(
          color: AppColors.title,
          fontSize: AppFontSize.sectiontitle,
          text: "Your last activity",
        ),
        20.height,
        Row(
          children: [
            Expanded(
              child: ActivityCard(
                  title: 'Flags',
                  ontap: () {},
                  cardColor: AppColors.purpleColor),
            ),
            16.width,
            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }
}
