import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();

  final Dio dio;

  DioClient._internal() : dio = Dio() {
    dio.options.responseType = ResponseType.json;
  }

  factory DioClient() => _instance;

  /// Allows adding interceptors from outside `core`
  void addInterceptors(List<Interceptor> interceptors) {
    dio.interceptors.addAll(interceptors);
  }
}
