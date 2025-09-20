import 'package:bookly_app/features/home/presentation/views/widget/custom_app_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Gap(70), CustomAppBar()]);
  }
}
