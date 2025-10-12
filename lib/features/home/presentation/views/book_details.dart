import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view_model/feature_Similar_book/feature_similar_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widget/book_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key, required this.book});
  final BookModel book;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  void initState() {
    BlocProvider.of<FeatureSimilarBookCubit>(
      context,
    ).getSimilarBook(widget.book.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailsBody(book: widget.book)),
    );
  }
}
