import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/widgets.dart';

class AppLogo {
  static Container logo({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(image: AssetImage(AssetsBookly.logo)),
      ),
    );
  }
}
