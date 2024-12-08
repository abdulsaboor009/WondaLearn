import 'package:flutter/material.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';

import '../../utils/constants/appfontsize.dart';
import 'custom_text.dart';
import 'responsive_size.dart';

class BundlesCard extends StatelessWidget {
  final Color cardColor;
  final String title, subtitle, image;
  const BundlesCard(
      {super.key,
      required this.cardColor,
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveSize.w * 20, vertical: ResponsiveSize.h * 26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: cardColor.withOpacity(0.15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldTextWidget(
                    color: cardColor,
                    fontSize: AppFontSize.largetitle,
                    text: title,
                  ),
                  5.height,
                  MediumTextWidget(
                    color: cardColor,
                    fontSize: AppFontSize.discription,
                    text: subtitle,
                  ),
                ],
              ),
            ),
            22.width,
            Image.asset(
              image,
              height: ResponsiveSize.h * 38,
            )
          ],
        ),
      ),
    );
  }
}
