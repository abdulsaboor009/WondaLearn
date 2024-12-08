// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum Appfontweight {
  thin,
  normal,
  medium,
  semi_bold,
  bold,
  extra_bold,
  very_extra_bold,
}

extension FontWeightExtension on Appfontweight {
  FontWeight get font {
    switch (this) {
      case Appfontweight.thin:
        return FontWeight.w300;
      case Appfontweight.normal:
        return FontWeight.w400;
      case Appfontweight.medium:
        return FontWeight.w500;
      case Appfontweight.semi_bold:
        return FontWeight.w600;
      case Appfontweight.bold:
        return FontWeight.w700;
      case Appfontweight.extra_bold:
        return FontWeight.w800;
      case Appfontweight.very_extra_bold:
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }
}
