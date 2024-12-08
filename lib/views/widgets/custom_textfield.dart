import 'package:flutter/material.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/appfontsize.dart';
import 'responsive_size.dart';

Widget customTextfield({
  TextEditingController? controller,
  String? hint,
  bool? isobscure = false,
  Widget? prefixWidget,
  Widget? suffixWidget,
  Function? onFieldSubmitted,
  Function? onChanged,
  bool onChangedbool = false,
  // double contentVerticlePadding = 19,
  double height = 68,
  String? Function(String?)? onValidator,
  // bool validator = false,
  TextInputType? keyboardType,
  int maxline = 1,
  Color fillColor = AppColors.textFieldFillColor,
  double borderWidth = 0,
  Color borderColor = Colors.transparent,
  double borderRadius = 12,
  Color hintTextColor = AppColors.textFieldHintColor,
  bool enabled = true,
}) {
  return SizedBox(
    child: TextFormField(
      enabled: enabled,
      validator: onValidator,
      onChanged: (v) {
        onChangedbool ? onChanged!(v) : (v) {};
      },
      maxLines: maxline,
      keyboardType: keyboardType,
      style: TextStyle(
        fontFamily: 'Nunito-Medium',
        color: AppColors.title,
        fontSize: AppFontSize.textFieldtextSize,
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      textAlign: TextAlign.start,
      obscureText: isobscure!,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: ResponsiveSize.w * 16, vertical: ResponsiveSize.h * 17),
        hintStyle: TextStyle(
          fontFamily: 'Nunito-Medium',
          fontSize: AppFontSize.textFieldtextSize,
          color: hintTextColor,
          fontWeight: FontWeight.w500,
        ),
        hintText: hint,
        fillColor: fillColor,
        filled: true,
        // prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(borderRadius),
        //   borderSide: BorderSide(color: borderColor, width: borderWidth),
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: borderWidth)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        errorStyle: TextStyle(
          fontFamily: 'Nunito-Medium',
          color: Colors.red,
          fontSize: AppFontSize.textFieldtextSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
