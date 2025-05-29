import 'package:dio/dio.dart' show CancelToken;
import 'package:flutter_guiritter/extension/_import.dart'
    show DateTimeNullableExtension;
import 'package:flutter_guiritter/model/_import.dart' show LoadingTagModel;

LoadingTagModel buildTag({
  required String userFriendlyName,
  required CancelToken cancelToken,
}) =>
    LoadingTagModel(
      id: DateTime.now().getISO8601()!,
      userFriendlyName: userFriendlyName,
      cancelToken: cancelToken,
    );
