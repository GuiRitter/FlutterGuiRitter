import 'package:dio/dio.dart'
    show CancelToken, Headers, Options, ProgressCallback;
import 'package:dio/io.dart' show DioForNative;
import 'package:flutter_guiritter/common/_import.dart' show Settings;
import 'package:flutter_guiritter/model/_import.dart' show Result;
import 'package:flutter_guiritter/service/dio/dio_for_any.interface.dart'
    show DioForAny;
import 'package:flutter_guiritter/service/interceptors/token.interceptor.dart'
    show buildTokenInterceptor;

DioForAny getDioForAny() => DioForAnyNative();

class DioForAnyNative extends DioForNative implements DioForAny {
  DioForAnyNative() {
    options.baseUrl = Settings.apiUrl;
    options.contentType = Headers.formUrlEncodedContentType;
    // options.contentType = Headers.jsonContentType;
    // options.headers.putIfAbsent(
    //   'Access-Control-Allow-Origin',
    //   () => '*',
    // );
    interceptors.add(
      buildTokenInterceptor(),
    );
  }

  @override
  Future<Result> httpDelete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Result.fromResponse(
        response: response,
      );
    } catch (exception) {
      return Result.fromException(
        exception: exception,
      );
    }
  }

  @override
  Future<Result> httpGet(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await get(
        path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return Result.fromResponse(
        response: response,
      );
    } catch (exception) {
      return Result.fromException(
        exception: exception,
      );
    }
  }

  @override
  Future<Result> httpPatch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Result.fromResponse(
        response: response,
      );
    } catch (exception) {
      return Result.fromException(
        exception: exception,
      );
    }
  }

  @override
  Future<Result> httpPost(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Result.fromResponse(
        response: response,
      );
    } catch (exception) {
      return Result.fromException(
        exception: exception,
      );
    }
  }

  @override
  Future<Result> httpRequest(
    String method,
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (options == null) {
      options = Options(
        method: method,
      );
    } else {
      options.method = method;
    }

    try {
      final response = await request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Result.fromResponse(
        response: response,
      );
    } catch (exception) {
      return Result.fromException(
        exception: exception,
      );
    }
  }
}
