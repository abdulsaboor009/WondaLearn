import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoldTextWidget extends StatelessWidget {
  String? text;
  double? fontSize;
  Color? color;
  TextAlign? textAlign;
  double? letterSpacing;
  Paint? foreground;
  BoldTextWidget(
      {super.key,
      this.text,
      this.fontSize,
      this.color,
      this.textAlign,
      this.letterSpacing,
      this.foreground});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text!,
      style: TextStyle(
        fontFamily: 'Nunito-Bold',
        foreground: foreground,
        letterSpacing: letterSpacing,
        fontSize: fontSize!,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }
}

// ignore: must_be_immutable
class SemiBoldTextWidget extends StatelessWidget {
  String? text;
  double? fontSize;
  Color? color;
  TextAlign? textAlign;
  double? letterSpacing;
  Paint? foreground;
  SemiBoldTextWidget(
      {super.key,
      this.text,
      this.fontSize,
      this.color,
      this.textAlign,
      this.letterSpacing,
      this.foreground});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text!,
      style: TextStyle(
        fontFamily: 'Nunito-SemiBold',
        foreground: foreground,
        letterSpacing: letterSpacing,
        fontSize: fontSize!,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}

// ignore: must_be_immutable
class MediumTextWidget extends StatelessWidget {
  String? text;
  double? fontSize;
  Color? color;
  TextAlign? textAlign;
  double? letterSpacing;
  Paint? foreground;
  MediumTextWidget(
      {super.key,
      this.text,
      this.fontSize,
      this.color,
      this.textAlign,
      this.letterSpacing,
      this.foreground});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text!,
      style: TextStyle(
        fontFamily: 'Nunito-Medium',
        foreground: foreground,
        letterSpacing: letterSpacing,
        fontSize: fontSize!,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}