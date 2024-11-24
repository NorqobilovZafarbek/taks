import 'package:dio/dio.dart';

enum Method { get, post, put, patch, delete }

class ApiServices {
  final Dio _dio;

  ApiServices({required String baseUrl})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            responseType: ResponseType.json,
          ),
        );

  Future<T> request<T>(
    String path, {
    Method method = Method.get,
    required T Function(Object? json) convert,
    Map<String, Object?>? data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) async {
    final response = await _dio.request(
      path,
      data: data,
      queryParameters: queryParams,
      options: Options(
        method: method.name,
        headers: headers,
        contentType: 'application/json',
      ),
    );

    return convert(response.data);
  }
}
