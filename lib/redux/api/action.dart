import 'package:dio/dio.dart' show CancelToken;
import 'package:flutter_guiritter/common/_import.dart'
    show HTTPMethod, ResultStatus, Settings;
import 'package:flutter_guiritter/model/_import.dart'
    show BaseRequestModel, LoadingTagModel, Result, StateModelWrapper;
import 'package:flutter_guiritter/redux/loading/action.dart' as loading_action;
import 'package:flutter_guiritter/redux/user/action.dart' as user_action;
import 'package:flutter_guiritter/util/_import.dart' show buildTag, logger;
import 'package:flutter_guiritter/util/_import.dart' show showSnackBar;
import 'package:redux/redux.dart' show Store;
import 'package:redux_thunk/redux_thunk.dart' show ThunkAction;

final _api = Settings.api;

final _log = logger('dio.action.dart');

void clearToken() {
  _log('clearToken').print();

  _api.options.headers.remove(
    Settings.tokenKey,
  );
}

ThunkAction<Map<String, dynamic>> get({
  required String url,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic> config = const <String, dynamic>{},
  required String userFriendlyName,
  required Future<void> Function({
    required Result result,
  }) thenFunction,
  Future<void> Function({
    required Result result,
  })? catchFunction,
  Future<void> Function()? finallyFunction,
}) =>
    (
      Store<Map<String, dynamic>> store,
    ) async {
      _log('get')
          .raw('url', url)
          .raw('queryParameters', queryParameters)
          .raw('config', config)
          .raw('userFriendlyName', userFriendlyName)
          .exists('then', thenFunction)
          .exists('catch', catchFunction)
          .exists('finally', finallyFunction)
          .print();

      store.dispatch(
        _requestAndToggleLoading(
          method: HTTPMethod.get,
          url: url,
          queryParameters: queryParameters,
          data: null,
          config: config,
          userFriendlyName: userFriendlyName,
          thenFunction: thenFunction,
          catchFunction: catchFunction,
          finallyFunction: finallyFunction,
        ),
      );
    };

ThunkAction<Map<String, dynamic>> post({
  required String url,
  Map<String, dynamic>? queryParameters,
  BaseRequestModel? data,
  Map<String, dynamic> config = const <String, dynamic>{},
  required String userFriendlyName,
  required Future<void> Function({
    required Result result,
  }) thenFunction,
  Future<void> Function({
    required Result result,
  })? catchFunction,
  Future<void> Function()? finallyFunction,
}) =>
    (
      Store<Map<String, dynamic>> store,
    ) async {
      _log('post')
          .raw('url', url)
          .raw('queryParameters', queryParameters)
          .map('data', data)
          .raw('config', config)
          .raw('userFriendlyName', userFriendlyName)
          .exists('then', thenFunction)
          .exists('catch', catchFunction)
          .exists('finally', finallyFunction)
          .print();

      store.dispatch(
        _requestAndToggleLoading(
          method: HTTPMethod.post,
          url: url,
          queryParameters: queryParameters,
          data: data,
          config: config,
          userFriendlyName: userFriendlyName,
          thenFunction: thenFunction,
          catchFunction: catchFunction,
          finallyFunction: finallyFunction,
        ),
      );
    };

void setToken({
  required String token,
}) {
  _log('setToken').secret('token', token).print();

  _api.options.headers[Settings.tokenKey] = token;
}

Future<void> showSnackBarFromResult({
  required Result result,
}) async {
  _log('showSnackBarFromResult').map('result', result).print();

  showSnackBar(
    message: result.message,
  );
}

void toggleToken({
  required String? token,
}) {
  _log('toggleToken').secret('token', token).print();

  if (token == null) {
    clearToken();
  } else {
    setToken(
      token: token,
    );
  }
}

Future<Result<dynamic>> _getResult({
  required HTTPMethod method,
  required String url,
  Map<String, dynamic>? queryParameters,
  BaseRequestModel? data,
  required CancelToken cancelToken,
}) async {
  _log('_getResult')
      .enum_('method', method)
      .raw('url', url)
      .raw('queryParameters', queryParameters)
      .map('data', data)
      .asString('cancelToken', cancelToken)
      .print();

  final request = {
        HTTPMethod.get: () => _api.httpGet(
              url,
              queryParameters: queryParameters,
              data: data?.toJson(),
              cancelToken: cancelToken,
            ),
        HTTPMethod.post: () => _api.httpPost(
              url,
              queryParameters: queryParameters,
              data: data?.toJson(),
              cancelToken: cancelToken,
            ),
      }[method] ??
      () => _api.httpRequest(
            method.name,
            url,
            queryParameters: queryParameters,
            data: data?.toJson(),
            cancelToken: cancelToken,
          );

  return await request();
}

ThunkAction<Map<String, dynamic>> _requestAndToggleLoading({
  required HTTPMethod method,
  required String url,
  Map<String, dynamic>? queryParameters,
  BaseRequestModel? data,
  Map<String, dynamic> config = const <String, dynamic>{},
  required String userFriendlyName,
  required Future<void> Function({
    required Result result,
  }) thenFunction,
  Future<void> Function({
    required Result result,
  })? catchFunction,
  Future<void> Function()? finallyFunction,
}) =>
    (
      Store<Map<String, dynamic>> store,
    ) async {
      _log('_requestAndToggleLoading')
          .raw('url', url)
          .raw('config', config)
          .exists('then', thenFunction)
          .exists('catch', catchFunction)
          .exists('finally', finallyFunction)
          .print();

      final loadingTag = buildTag(
        userFriendlyName: userFriendlyName,
        cancelToken: CancelToken(),
      );

      store.dispatch(
        loading_action.add(
          list: [
            loadingTag,
          ],
        ),
      );

      final result = await _getResult(
        method: method,
        url: url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: loadingTag.cancelToken,
      );

      store.dispatch(
        _treatResult(
          result: result,
          thenFunction: thenFunction,
          catchFunction: catchFunction,
          finallyFunction: finallyFunction,
          loadingTag: loadingTag,
        ),
      );
    };

ThunkAction<Map<String, dynamic>> _treatResult({
  required Result result,
  required Future<void> Function({
    required Result result,
  }) thenFunction,
  Future<void> Function({
    required Result result,
  })? catchFunction,
  Future<void> Function()? finallyFunction,
  required LoadingTagModel loadingTag,
}) =>
    (
      Store<Map<String, dynamic>> store,
    ) async {
      final state = StateModelWrapper(
        storeStateMap: store.state,
      );

      _log('_treatResult')
          .map('result', result)
          .exists('then', thenFunction)
          .exists('catch', catchFunction)
          .exists('finally', finallyFunction)
          .map('loadingTag', loadingTag)
          .print();

      if (result.status == ResultStatus.success) {
        await thenFunction(
          result: result,
        );
      } else {
        if (result.status == ResultStatus.unauthorized) {
          store.dispatch(
            user_action.signOut(),
          );
          showSnackBar(
            message: result.message,
          );
        } else if (result.status == ResultStatus.cancelled) {
          // do nothing
        } else if (result.message == null) {
          showSnackBar(
            message: state.l10nGuiRitter!.unexpectedError,
          );
        } else {
          showSnackBar(
            message: result.message,
          );
        }

        if (catchFunction != null) {
          await catchFunction(
            result: result,
          );
        }
      }

      if (finallyFunction != null) {
        await finallyFunction();
      }

      store.dispatch(
        loading_action.remove(
          idList: [
            loadingTag.id,
          ],
        ),
      );
    };
