import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_text_button.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view_model/feature_Similar_book/feature_similar_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widget/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<FeatureSimilarBookCubit, FeatureSimilarBookState>(
      builder: (context, state) {
        if (state is FeatureSimilarBookFailure) {
          return Text(state.errorMessage);
        } else if (state is FeatureSimilarBookSuccess) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomAppBarBookDetails(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: (width * .2)),
                        child: CustomListViewItem(
                          image: book.volumeInfo!.imageLinks!.thumbnail!,
                        ),
                      ),
                      Gap(20),
                      Text('The King Kong Book', style: Styles.textStyle30),
                      Gap(5),
                      Text(
                        'Mohamed Hatem',
                        style: Styles.textStyle20.copyWith(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Gap(6),
                          Text(
                            '4.8 (234)',
                            style: Styles.textStyle20.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Gap(20),
                      BookAction(
                        onTap: () async {
                          Uri uri = Uri.parse(book.volumeInfo!.previewLink!);
                          if (!await launchUrl(uri)) {
                            throw Exception('Could not launch $uri');
                          } else {
                            await launchUrl(uri);
                          }
                          print('object');
                        },
                      ),
                      Expanded(child: Gap(10)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'You Can Also Like',
                          style: Styles.textStyle18,
                        ),
                      ),
                      CustomListViewBooks(books: state.books),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class CustomAppBarBookDetails extends StatelessWidget {
  const CustomAppBarBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.close)),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
      ],
    );
  }
}

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextButton(
            text: '124\$',
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
            textColor: Colors.black,
            backGroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: CustomTextButton(
            ontap: onTap,
            text: 'free preview',
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            textColor: Colors.white,
            backGroundColor: Colors.orange.shade500,
          ),
        ),
      ],
    );
  }
}

class CustomListViewBooks extends StatelessWidget {
  const CustomListViewBooks({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .17,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return CustomListViewItem(
            image:
                books[index].volumeInfo!.imageLinks!.thumbnail ??
                AssetsBookly.test,
          );
        },
      ),
    );
  }
}
