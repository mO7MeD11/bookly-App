import 'package:bookly_app/features/home/presentation/view_model/feature_newset_book_cubit/feature_newset_book_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widget/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      FeatureNewsetBookCubitCubit,
      FeatureNewsetBookCubitState
    >(
      builder: (context, state) {
        if (state is FeatureNewsetBookCubitFailure) {
          return Text(state.errorMessage);
        } else if (state is FeatureNewsetBookCubitSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(book: state.books[index]),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
