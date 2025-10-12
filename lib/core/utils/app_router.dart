import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/model/repo/home_repo_implementaion.dart';
import 'package:bookly_app/features/home/presentation/view_model/feature_Similar_book/feature_similar_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/feature_book_cubit/feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/home.dart';
import 'package:bookly_app/features/home/presentation/views/book_details.dart';
import 'package:bookly_app/features/search/presentation/view/search.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: '/homeView', builder: (context, state) => Home()),
      GoRoute(
        path: '/homeDetails',
        builder: (context, state) => BlocProvider(
          create: (context) =>
              FeatureSimilarBookCubit(getIt.get<HomeRepoImplementation>()),
          child: BookDetails(book: state.extra as BookModel),
        ),
      ),
      GoRoute(path: '/Search', builder: (context, state) => Search()),
    ],
  );
}
