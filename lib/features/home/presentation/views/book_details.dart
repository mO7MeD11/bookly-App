import 'package:bookly_app/features/home/presentation/views/widget/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: BookDetailsBody()));
  }
}
