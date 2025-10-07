import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/model/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation extends HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBook() async {
    try {
      var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=programming&Sorting=newest',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(item);
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(errorMessage: 'oops there was ane error'));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchAllBook() async {
    try {
      var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=programming',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(errorMessage: 'oops there was ane error ${e.toString()}'));
      }
    }
  }
}
