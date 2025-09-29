import 'package:bookly_app/features/search/presentation/view/widget/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchBody());
  }
}
