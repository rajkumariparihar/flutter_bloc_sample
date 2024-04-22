import 'package:dio/dio.dart';

typedef ApiClientCallback = void Function(int value);

/// This is the singleton API client class which handlers all cloud  transactions
/// All the task raw queries is handle here and return a Future<T> with result
class DioApiClient {
  static const int? timeout = 30000;

  bool? didInit = false;

  Dio? dio;

  /// used to notify listener where login is required when refresh token is expired
  // ApiClientCallback listener;

  Dio? getApiClient() {
    return dio;
  }

  String? baseUrl;

  DioApiClient() {
    var options = BaseOptions(baseUrl: baseUrl ?? '');
    dio = Dio(options);
    dio?.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }
}
