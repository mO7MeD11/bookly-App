import 'package:animate_do/animate_do.dart';
import 'package:bookly_app/core/helper/logo.dart';
import 'package:bookly_app/features/home/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: AppLogo.logo(width: 200, height: 130)),
        SizedBox(height: 10),
        fadeInAnimation(context),
      ],
    );
  }

  FadeInUp fadeInAnimation(context) {
    return FadeInUp(
      delay: Duration(seconds: 2),
      onFinish: (direction) {
        GoRouter.of(context).push('/homeView');
      },
      child: Text(
        'Read Free Book',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
