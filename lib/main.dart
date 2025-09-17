import 'package:bookly_app/features/splash/data/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() {
  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: SplashView(
        
      ) ,
    ) ;
  }
}