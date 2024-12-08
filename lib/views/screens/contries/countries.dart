import 'package:flutter/material.dart';
import '../../../utils/constants/appassets.dart';
import '../../../utils/constants/appcolors.dart';
import '../../../utils/constants/appfontsize.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/responsive_size.dart';
import '../../widgets/sizedbox_extention.dart';
import 'components/word_list.dart';

// ignore: must_be_immutable
class ContriesScreen extends StatelessWidget {
  const ContriesScreen({super.key});

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
                              text: "Countries",
                            ),
                          ),
                          const SizedBox()
                        ],
                      ),
                      ContriesWordList(),
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
