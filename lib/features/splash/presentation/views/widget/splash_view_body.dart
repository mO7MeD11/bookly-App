import 'package:animate_do/animate_do.dart';
import 'package:bookly_app/core/helper/logo.dart';
import 'package:bookly_app/features/home/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: AppLogo.logo(width: 200, height: 130)),
        SizedBox(height: 10),
        fadeInAnimation(),
      ],
    );
  }

  FadeInUp fadeInAnimation() {
    return FadeInUp(
      delay: Duration(seconds: 2),
      onFinish: (direction) {
        navigateToTome();
      },
      child: Text(
        'Read Free Book',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  void navigateToTome() {
    Get.to(
      Home(),
      transition: Transition.leftToRight,
      duration: Duration(seconds: 3),
    );
  }
}
