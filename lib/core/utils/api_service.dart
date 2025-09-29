import 'package:dio/dio.dart';

class ApiService {
  String paseUrl = 'https://www.googleapis.com/books/v1/volumes';
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> get(String endpoint)async {
    var response = await  dio.get('$paseUrl$endpoint');

    return response.data ;
  }
}
