import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widget/best_seller_list_liew.dart';
import 'package:bookly_app/features/home/presentation/views/widget/best_seller_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widget/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widget/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(70),
                CustomAppBar(),
                CustomListView(),
                Gap(10),
                Text('Best Seller', style: Styles.textStyle20),
                Gap(20),
              ],
            ),
          ),
          SliverToBoxAdapter(child: BestSellerListView()),
        ],
      ),
    );
  }
}
