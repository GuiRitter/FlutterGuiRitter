import 'package:dio/dio.dart'
    show BaseOptions, CancelToken, Options, ProgressCallback;
import 'package:flutter_guiritter/model/_import.dart' show Result;

import 'dio_for_any.stub.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'package:flutter_guiritter/service/dio/dio_for_any.native.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'package:flutter_guiritter/service/dio/dio_for_any.browser.dart';

/// https://stackoverflow.com/questions/58710226/how-to-import-platform-specific-dependency-in-flutter-dart-combine-web-with-an/58713064#58713064
abstract class DioForAny {
  late BaseOptions options;

  /// factory constructor to return the correct implementation.
  factory DioForAny() => getDioForAny();

  Future<Result> httpDelete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<Result> httpGet(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<Result> httpPatch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Result> httpPost(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Result> httpRequest(
    String method,
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}
