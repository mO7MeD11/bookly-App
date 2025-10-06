import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';

class FeatureBookState {
  const FeatureBookState();
}

class FeatureBookInitial extends FeatureBookState {}

class FeatureBookLoading extends FeatureBookState {}

class FeatureBookSuccess extends FeatureBookState {
  const FeatureBookSuccess({required this.books});

  final List<BookModel> books;
}

class FeatureBookFailure extends FeatureBookState {
  final String errorMessage;
  const FeatureBookFailure(this.errorMessage);
}
