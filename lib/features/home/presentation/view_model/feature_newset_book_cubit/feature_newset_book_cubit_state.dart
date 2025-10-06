part of 'feature_newset_book_cubit_cubit.dart';

sealed class FeatureNewsetBookCubitState extends Equatable {
  const FeatureNewsetBookCubitState();

  @override
  List<Object> get props => [];
}

final class FeatureNewsetBookCubitInitial extends FeatureNewsetBookCubitState {}

final class FeatureNewsetBookCubitLoading extends FeatureNewsetBookCubitState {}

final class FeatureNewsetBookCubitSuccess extends FeatureNewsetBookCubitState {
  final List<BookModel> books;

  FeatureNewsetBookCubitSuccess({required this.books});
  
}

final class FeatureNewsetBookCubitFailure extends FeatureNewsetBookCubitState {
  final String errorMessage;

  FeatureNewsetBookCubitFailure({required this.errorMessage});
}
