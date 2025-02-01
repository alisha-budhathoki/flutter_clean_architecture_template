import 'package:dio/dio.dart';
import 'package:flutter_core_project/core/index.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = ExceptionString.cancelRequest;
        break;
      case DioExceptionType.connectionTimeout:
        message = ExceptionString.connectionTimeOut;
        break;
      case DioExceptionType.receiveTimeout:
        message = ExceptionString.receiveTimeOut;
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = ExceptionString.sendTimeOut;
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains("Socket")) {
          message = ExceptionString.socketException;
          break;
        }
        message = ExceptionString.unexpectedError;
        break;
      default:
        message = dioError.response?.data["message"] ?? '';
        break;
    }
  }

  String _handleError(int? statusCode, Response<dynamic>? error) {
    switch (statusCode) {
      case 400:
        return error?.data["message"] ?? ExceptionString.badRequest;
      case 401:
        return error?.data["message"] ?? ExceptionString.unauthorized;
      case 403:
        return error?.data["message"] ?? ExceptionString.forbidden;
      case 404:
        return error?.data["message"] ?? ExceptionString.notFound;
      case 422:
        return error?.data["message"] ?? ExceptionString.duplicateEmail;
      case 500:
        return error?.data["message"] ?? ExceptionString.internalServerError;
      case 502:
        return error?.data["message"] ?? ExceptionString.badGateway;
      default:
        // return ExceptionString.unknownError;
        return error?.data["message"] ?? ExceptionString.unknownError;
    }
  }

  @override
  String toString() => message;
}
