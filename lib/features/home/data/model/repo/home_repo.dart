import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchAllBook();
  Future<Either<Failure, List<BookModel>>> fetchNewestBook();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBook(String category);
}
