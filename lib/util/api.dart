import 'package:dio/dio.dart' show DioException;
import 'package:flutter_guiritter/common/_import.dart' show Settings;

String treatDioResponse({
  required dynamic response,
}) {
  if (response!.data is Map) {
    if ((response!.data as Map).containsKey(
      Settings.errorKey,
    )) {
      return response!.data[Settings.errorKey];
    }
  }
  return response!.data.toString();
}

String treatException({
  required dynamic exception,
}) {
  if (exception is DioException) {
    if (exception.response != null) {
      return treatDioResponse(
        response: exception.response,
      );
    } else if (exception.message != null) {
      return exception.message!;
    }
  }
  return exception.toString();
}
