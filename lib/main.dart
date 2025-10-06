import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/model/repo/home_repo_implementaion.dart';
import 'package:bookly_app/features/home/presentation/view_model/feature_book_cubit/feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/feature_newset_book_cubit/feature_newset_book_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/home.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

main() {
  setup();
  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeatureBooksCubit(homeRepo: getIt.get<HomeRepoImplementation>()),
        ),
        BlocProvider(create: (context)=> FeatureNewsetBookCubitCubit(getIt.get<HomeRepoImplementation>()) ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPColor,
          appBarTheme: AppBarTheme(
            color: kPColor,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
