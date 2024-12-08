import 'package:flutter/material.dart';
import 'responsive_size.dart';

extension SizedBoxExtension on num {
  SizedBox get height => SizedBox(
        height: ResponsiveSize.h * this,
      );

  SizedBox get width => SizedBox(
        width: ResponsiveSize.w * this,
      );
}

final screenPadding = ResponsiveSize.w * 20;