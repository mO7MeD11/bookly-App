import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/model/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'feature_newset_book_cubit_state.dart';

class FeatureNewsetBookCubitCubit extends Cubit<FeatureNewsetBookCubitState> {
  FeatureNewsetBookCubitCubit(this.homeRepo)
    : super(FeatureNewsetBookCubitInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestBook() async {
    emit(FeatureNewsetBookCubitLoading());
    var value = await homeRepo.fetchNewestBook();

    value.fold(
      (failure) {
        emit(FeatureNewsetBookCubitFailure(errorMessage: failure.errorMessage));
      },
      (book) {
        emit(FeatureNewsetBookCubitSuccess(books: book));
      },
    );
  }
}
