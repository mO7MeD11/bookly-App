import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDio(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: "Connection timeout with the server",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "Send timeout occurred");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "Receive timeout occurred");
      case DioExceptionType.badResponse:
        if (dioException.response != null) {
          return ServerFailure.fromResponse(dioException.response!);
        }
        return ServerFailure(errorMessage: "Bad response from server");

      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage: "Connection error. Please check your internet",
        );
      case DioExceptionType.unknown:
      default:
        return ServerFailure(errorMessage: "Unexpected error occurred");
    }
  }

  factory ServerFailure.fromResponse(Response response) {
    final statusCode = response.statusCode;
    final data = response.data;

    if (data is Map<String, dynamic> && data['error'] != null) {
      final error = data['error'];

      if (error is Map<String, dynamic>) {
        if (error['message'] != null) {
          return ServerFailure(errorMessage: error['message']);
        }

        if (error['errors'] != null && error['errors'] is List) {
          final errorsList = error['errors'] as List;
          if (errorsList.isNotEmpty && errorsList.first['message'] != null) {
            return ServerFailure(errorMessage: errorsList.first['message']);
          }
        }
      }
    }

    return ServerFailure(
      errorMessage: "Bad response from server (Status code: $statusCode)",
    );
  }
}
