import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'utils/constants/appcolors.dart';
import 'views/screens/splash/splash.dart';

void main() {
  runApp(const Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(scaffoldBackgroundColor: AppColors.backgroundColor),
      home: const SplashScreen(),
    );
  }
}
