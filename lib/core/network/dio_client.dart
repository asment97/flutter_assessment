import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Endpoints {
  Endpoints._();

  static String baseUrl = "https://jsonplaceholder.typicode.com/";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(seconds: 30);

  // connectTimeout
  static const Duration connectionTimeout = Duration(seconds: 30);
}

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient(Dio(), ref);
});

class DioClient {
// dio instance
  final Dio _dio;
  final Ref ref;

  DioClient(this._dio, this.ref) {
    initiate();
  }

  initiate() {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.responseType = ResponseType.json;
  }

  Map<String, String> get headers {
    var headers = {
      "Content-Type": "application/json; charset=UTF-8",
    };

    return headers;
  }

  Options get defaultOptions {
    return Options(
      headers: headers,
    );
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options ?? defaultOptions,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      // Change to JSON if is String
      if (response.data.runtimeType == String) {
        response.data = jsonDecode(response.data);
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? defaultOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      // Change to JSON if is String
      if (response.data.runtimeType == String) {
        response.data = jsonDecode(response.data);
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? defaultOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      // Change to JSON if is String
      if (response.data.runtimeType == String) {
        response.data = jsonDecode(response.data);
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? defaultOptions,
        cancelToken: cancelToken,
      );

      // Change to JSON if is String
      if (response.data.runtimeType == String) {
        response.data = jsonDecode(response.data);
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
