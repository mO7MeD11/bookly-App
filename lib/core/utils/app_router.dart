import 'package:bookly_app/features/home/presentation/views/home.dart';
import 'package:bookly_app/features/home/presentation/views/book_details.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: '/homeView', builder: (context, state) => Home()),
      GoRoute(path: '/homeDetails', builder: (context, state) => BookDetails()),
    ],
  );
}
