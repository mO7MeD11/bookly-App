import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view_model/feature_book_cubit/feature_book_state.dart';
import 'package:bookly_app/features/home/presentation/view_model/feature_book_cubit/feature_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBookState>(
      builder: (context, state) {
        if (state is FeatureBookLoading) {
          return CircularProgressIndicator();
        } else if (state is FeatureBookFailure) {
          return Text(state.errorMessage);
        } else if (state is FeatureBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return CustomListViewItem(
                  image: state
                      .books[index]
                      .volumeInfo!
                      .imageLinks!
                      .smallThumbnail!,
                  index: index,
                );
              },
            ),
          );
        } else {
          return Text('');
        }
      },
    );
  }
}

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, this.image, this.index});
  final String? image;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.9 / 4,
      child: Container(
        margin: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: CachedNetworkImage(
            imageUrl: image!,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
