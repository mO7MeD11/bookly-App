import 'package:bookly_app/core/helper/logo.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppLogo.logo(width: 100, height: 80),
        Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push('/Search');
          },
          icon: Icon(Icons.search, size: 32),
        ),
      ],
    );
  }
}
