import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(dioError.response?.statusCode);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        if (dioError.message?.contains("SocketException") ?? false) {
          message = "No Internet";
          break;
        }
        message = dioError.message ?? "Something went wrong";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Status Code 400: Bad request';
      case 401:
        return 'Status Code 401: Unauthorized';
      case 403:
        return 'Status Code 403: Forbidden';
      case 404:
        return 'Status Code 404: Not Found';
      case 500:
        return 'Status Code 500: Internal server error';
      case 502:
        return 'Status Code 502: Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
