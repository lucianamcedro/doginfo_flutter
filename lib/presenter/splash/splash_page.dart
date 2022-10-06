import 'package:doginfo/presenter/pages.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 1800,
        centered: true,
        splash: Lottie.asset('assets/images/paws.json'),
        splashIconSize: 650,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
        backgroundColor: Colors.amber,
        nextScreen: const LoginPage());
  }
}
