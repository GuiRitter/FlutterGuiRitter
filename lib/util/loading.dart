import 'package:dio/dio.dart' show CancelToken;
import 'package:flutter_guiritter/model/model.import.dart' show LoadingTagModel;
import 'package:flutter_guiritter/util/util.import.dart'
    show DateTimeNullableExtension;

LoadingTagModel buildTag({
  required String userFriendlyName,
  required CancelToken cancelToken,
}) =>
    LoadingTagModel(
      id: DateTime.now().getISO8601()!,
      userFriendlyName: userFriendlyName,
      cancelToken: cancelToken,
    );
