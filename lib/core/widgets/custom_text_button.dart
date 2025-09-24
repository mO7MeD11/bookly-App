import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.textColor,
    required this.backGroundColor,
  });
  final String text;
  final BorderRadius borderRadius;
  final Color textColor;
  final Color backGroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: () {},

        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(text, style: Styles.textStyle20.copyWith(color: textColor)),
      ),
    );
  }
}
