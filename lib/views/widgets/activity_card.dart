import 'package:flutter/material.dart';

import '../../utils/constants/appcolors.dart';
import '../../utils/constants/appfontsize.dart';
import 'custom_text.dart';
import 'responsive_size.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final VoidCallback? ontap;
  final Color cardColor;
  const ActivityCard(
      {super.key,
      required this.title,
      required this.ontap,
      required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap!,
      child: Container(
        height: ResponsiveSize.h * 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: cardColor.withOpacity(0.15)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: BoldTextWidget(
                color: cardColor,
                fontSize: AppFontSize.largetitle,
                text: title,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: ontap!,
                child: Container(
                  height: ResponsiveSize.h * 36,
                  width: ResponsiveSize.w * 65,
                  decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.whiteColor,
                      size: ResponsiveSize.h * 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
