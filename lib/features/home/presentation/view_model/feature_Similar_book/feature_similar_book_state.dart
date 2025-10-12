part of 'feature_similar_book_cubit.dart';

sealed class FeatureSimilarBookState extends Equatable {
  const FeatureSimilarBookState();

  @override
  List<Object> get props => [];
}

final class FeatureSimilarBookInitial extends FeatureSimilarBookState {}

final class FeatureSimilarBookLoading extends FeatureSimilarBookState {}

final class FeatureSimilarBookSuccess extends FeatureSimilarBookState {
  
  final List<BookModel> books;

  FeatureSimilarBookSuccess(this.books);
  
}

final class FeatureSimilarBookFailure extends FeatureSimilarBookState {
  final String errorMessage;

  FeatureSimilarBookFailure(  this.errorMessage );
}
