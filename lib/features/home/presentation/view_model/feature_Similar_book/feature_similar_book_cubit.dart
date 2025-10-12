import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/model/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'feature_similar_book_state.dart';

class FeatureSimilarBookCubit extends Cubit<FeatureSimilarBookState> {
  FeatureSimilarBookCubit(this.homeRepo) : super(FeatureSimilarBookInitial());
  final HomeRepo homeRepo;
  Future<void> getSimilarBook(String category) async {
    var result = await homeRepo.fetchSimilarBook(category);
     emit(FeatureSimilarBookLoading());
    result.fold(
      (failure) {
        emit(FeatureSimilarBookFailure(failure.errorMessage));
      },
      (books) {
        emit(FeatureSimilarBookSuccess(books));
      },
    );
  }
}
