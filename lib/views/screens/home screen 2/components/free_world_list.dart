import 'package:flutter/material.dart';
import 'package:quiz/views/widgets/custom_text.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';
import '../../../../utils/constants/appcolors.dart';
import '../../../../utils/constants/appfontsize.dart';
import '../../../widgets/activity_card.dart';

class HomeScreen2FreeWorldList extends StatelessWidget {
  const HomeScreen2FreeWorldList({super.key});

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
                ontap: () {},
                title: 'Flags',
                cardColor: AppColors.purpleColor,
              ),
            ),
            16.width,
            Expanded(
              child: ActivityCard(
                ontap: () {},
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
