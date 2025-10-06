import 'package:bookly_app/features/home/data/model/repo/home_repo.dart';
import 'package:bookly_app/features/home/presentation/view_model/feature_book_cubit/feature_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBooksCubit extends Cubit<FeatureBookState> {
  final HomeRepo homeRepo;

  FeatureBooksCubit(  {required this.homeRepo}) :super(FeatureBookInitial()) ;

  Future<void> fetchFeatureBooks() async {
    emit(FeatureBookLoading());
    var result = await homeRepo.fetchAllBook();

    result.fold(
      (failure) {
        emit(FeatureBookFailure(failure.errorMessage));
      },
      (books) {
        emit(FeatureBookSuccess(books: books));
      },
    );
  }
}
