import 'package:dio/dio.dart';

abstract class BaseInterceptor extends Interceptor {
  Future<String?> fetchToken();
  Future<String?> refreshToken();
  Future<void> updateToken(String token);
  void updateDioHeader(String token);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await fetchToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final newToken = await refreshToken();
      if (newToken != null) {
        await updateToken(newToken);
        updateDioHeader(newToken);

        // Retry the failed request
        final updatedRequest = await Dio().fetch(err.requestOptions);
        return handler.resolve(updatedRequest);
      }
    }
    handler.next(err);
  }
}
