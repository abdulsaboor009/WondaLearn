import 'package:flutter/material.dart';
import 'package:quiz/utils/constants/appassets.dart';
import 'package:quiz/views/widgets/sizedbox_extention.dart';
import '../../widgets/navigation_transition.dart';
import '../../widgets/responsive_size.dart';
import '../authentication/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startFadeAnimation();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          BottomToTopTransition(const LoginScreen()));
    });
  }

  startFadeAnimation() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        animate = false;
      });
    });
  }

  bool animate = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 1400),
            opacity: animate ? 0 : 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  AppAssets.splashLogo,
                  height: ResponsiveSize.h * 220,
                )),
                8.height,
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: ResponsiveSize.w * 105),
                  child: Image.asset(
                    AppAssets.appName,
                  ),
                ),
                70.height,
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1400),
                opacity: animate ? 0 : 1,
                child: SizedBox(
                    height: ResponsiveSize.h * 200,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Image.asset(
                          AppAssets.splashBottom2,
                          fit: BoxFit.fill,
                          height: ResponsiveSize.h * 200,
                          width: double.infinity,
                        ),
                        Image.asset(
                          AppAssets.splashBottom,
                          fit: BoxFit.fill,
                          height: ResponsiveSize.h * 200,
                          width: double.infinity,
                        ),
                      ],
                    )),
              )),
        ],
      ),
    );
  }
}
