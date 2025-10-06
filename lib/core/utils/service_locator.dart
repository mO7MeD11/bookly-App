import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/model/repo/home_repo_implementaion.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(apiService:  getIt.get<ApiService>() ),
  );
}
