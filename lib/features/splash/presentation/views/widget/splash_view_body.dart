import 'package:animate_do/animate_do.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 200,
            height: 130,
            decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(image: AssetImage(AssetsBookly.logo)),
            ),
          ),
        ),
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
