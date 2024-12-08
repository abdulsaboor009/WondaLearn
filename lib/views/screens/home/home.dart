import 'package:flutter/material.dart';
import 'package:quiz/utils/constants/appassets.dart';
import 'package:quiz/views/widgets/responsive_size.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';

import '../../../utils/constants/appcolors.dart';
import '../../../utils/constants/appfontsize.dart';
import '../../widgets/custom_text.dart';
import 'components/bundles.dart';
import 'components/free_world_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                child: Column(
                  children: [
                    55.height,
                    BoldTextWidget(
                      color: AppColors.title,
                      fontSize: AppFontSize.screenTitle,
                      text: "Home Screen",
                    ),
                    20.height,
                    const HomeFreeWorldList(),
                    HomeBundles()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
