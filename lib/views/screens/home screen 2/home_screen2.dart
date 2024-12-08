import 'package:flutter/material.dart';
import 'package:quiz/utils/constants/appassets.dart';
import 'package:quiz/views/screens/home%20screen%202/components/free_world_list.dart';
import 'package:quiz/views/screens/home%20screen%202/components/last_activity.dart';
import 'package:quiz/views/screens/home%20screen%202/components/my_bundles.dart';
import 'package:quiz/views/widgets/responsive_size.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';
import '../../../utils/constants/appcolors.dart';
import '../../../utils/constants/appfontsize.dart';
import '../../widgets/custom_text.dart';
import 'components/bundles.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

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
                      BoldTextWidget(
                        color: AppColors.title,
                        fontSize: AppFontSize.screenTitle,
                        text: "Home Screen",
                      ),
                      30.height,
                      HomeScreen2Bundles(),
                      HomeScreen2MyBundles(),
                      const HomeScreen2LastActivity(),
                      const HomeScreen2FreeWorldList(),
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
