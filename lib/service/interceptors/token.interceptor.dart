import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart'
    show DioException, ErrorInterceptorHandler, InterceptorsWrapper;
import 'package:flutter_guiritter/redux/main.reducer.dart' show dispatch;
import 'package:flutter_guiritter/redux/user/action.dart' as user_action;
import 'package:flutter_guiritter/util/util.import.dart' show logger;

final _log = logger('TokenInterceptor');

InterceptorsWrapper buildTokenInterceptor() => InterceptorsWrapper(
      onError: (
        DioException err,
        ErrorInterceptorHandler handler,
      ) async {
        _log('onError').asString('err', err).print();

        if (err.response?.statusCode == HttpStatus.unauthorized) {
          await dispatch(
            user_action.signOut(),
          );
        }

        if (err.response != null) {
          handler.resolve(
            err.response!,
          );
        } else {
          handler.next(
            err,
          );
        }
      },
    );
