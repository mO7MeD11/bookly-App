import 'package:bookly_app/core/helper/logo.dart';
 
import 'package:flutter/material.dart';
 

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppLogo.logo(width: 100, height: 80),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 32)),
      ],
    );
  }
}
