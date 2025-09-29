import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: Icon(Icons.search),
        border: allOutlineInputBorder(),
        focusedBorder: allOutlineInputBorder(),
        enabledBorder: allOutlineInputBorder(),
      ),
    );
  }
}

OutlineInputBorder allOutlineInputBorder() {
  return OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));
}
