import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart' show Response, DioException, DioExceptionType;
import 'package:flutter_guiritter/common/_import.dart' show ResultStatus;
import 'package:flutter_guiritter/model/_import.dart' show Loggable;
import 'package:flutter_guiritter/util/_import.dart'
    show treatDioResponse, treatException;

class Result<DataType> implements Loggable {
  final DataType? data;
  final ResultStatus status;
  final String? message;

  factory Result.fromException({
    required dynamic exception,
  }) {
    return Result._(
      status: getFromException(
        exception: exception,
      ),
      message: treatException(
        exception: exception,
      ),
    );
  }

  factory Result.fromResponse({
    required Response response,
  }) {
    return Result._(
      status: getFromHttpStatus(
        httpStatus: response.statusCode,
      ),
      message: treatDioResponse(
        response: response,
      ),
      data: response.data,
    );
  }

  Result.success({
    this.data,
    this.message,
  }) : status = ResultStatus.success;

  Result.warning({
    this.message,
    this.data,
  }) : status = ResultStatus.warning;

  Result._({
    this.data,
    required this.status,
    this.message,
  });

  @override
  Map<String, dynamic> asLog() => <String, dynamic>{
        'resultStatus': status.name,
        'message': message,
      };

  bool hasMessageNotIn({
    required ResultStatus status,
  }) =>
      (this.status != status);

  Result<NewDataType> withData<NewDataType>({
    required NewDataType Function(dynamic) handler,
  }) =>
      Result._(
        status: status,
        message: message,
        data: handler(
          data,
        ),
      );

  Result withoutData() => Result._(
        status: status,
        message: message,
        data: null,
      );

  static ResultStatus getFromException({
    required DioException exception,
  }) =>
      (exception.type == DioExceptionType.cancel)
          ? ResultStatus.cancelled
          : ResultStatus.error;

  static ResultStatus getFromHttpStatus({
    required int? httpStatus,
  }) {
    final statusCodeClass = httpStatus.toString()[0];
    return (httpStatus == HttpStatus.unauthorized)
        ? ResultStatus.unauthorized
        : (statusCodeClass == '2')
            ? ResultStatus.success
            : (statusCodeClass == '4')
                ? ResultStatus.warning
                // 3 or 5 or else
                : ResultStatus.error;
  }
}
