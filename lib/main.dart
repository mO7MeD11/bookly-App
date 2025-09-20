import 'package:bookly_app/constant.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() {
  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPColor,
        appBarTheme: AppBarTheme(
          color: kPColor,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      home: SplashView(),
    );
  }
}
