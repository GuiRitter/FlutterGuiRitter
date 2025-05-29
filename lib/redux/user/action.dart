import 'package:flutter_guiritter/common/_import.dart' show ApiUrl, Settings;
import 'package:flutter_guiritter/model/_import.dart'
    show Result, SignInRequestModel, StateModelWrapper;
import 'package:flutter_guiritter/redux/api/action.dart' as api_action;
import 'package:flutter_guiritter/util/_import.dart' show logger;
import 'package:redux/redux.dart' show Store;
import 'package:redux_thunk/redux_thunk.dart' show ThunkAction;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

final _log = logger('user.action');

ThunkAction<Map<String, dynamic>> clearToken() => (
      Store<Map<String, dynamic>> store,
    ) async {
      _log('clearToken').print();

      api_action.clearToken();

      var prefs = await SharedPreferences.getInstance();
      prefs.setString(
        Settings.tokenKey,
        '',
      );

      return store.dispatch(
        const AuthenticationAction(
          token: null,
        ),
      );
    };

ThunkAction<Map<String, dynamic>> signIn({
  required SignInRequestModel signInModel,
}) =>
    (
      Store<Map<String, dynamic>> store,
    ) async {
      final state = StateModelWrapper(
        storeStateMap: store.state,
      );

      _log('signIn').map('signInModel', signInModel).print();

      var prefs = await SharedPreferences.getInstance();

      prefs.setString(
        Settings.tokenKey,
        '',
      );

      signInSuccess({
        required Result result,
      }) async {
        _log('signInSuccess').map('result', result).print();

        final token =
            result.data[Settings.dataKey][Settings.tokenKey] as String;

        prefs.setString(
          Settings.tokenKey,
          token,
        );

        api_action.setToken(
          token: token,
        );

        store.dispatch(
          AuthenticationAction(
            token: token,
          ),
        );
      }

      signInFailure({
        required Result result,
      }) async =>
          store.dispatch(
            clearToken(),
          );

      store.dispatch(
        api_action.post(
          url: ApiUrl.signIn.path,
          data: signInModel,
          userFriendlyName: state.l10nGuiRitter!.loadingTag_validateAndSetToken,
          thenFunction: signInSuccess,
          catchFunction: signInFailure,
        ),
      );
    };

ThunkAction<Map<String, dynamic>> signOut() => (
      Store<Map<String, dynamic>> store,
    ) async {
      _log('signOut').print();

      return store.dispatch(
        validateAndSetToken(
          newToken: null,
        ),
      );
    };

ThunkAction<Map<String, dynamic>> validateAndSetToken({
  required String? newToken,
}) =>
    (
      Store<Map<String, dynamic>> store,
    ) async {
      _log('validateAndSetToken').secret('newToken', newToken).print();

      final state = StateModelWrapper(
        storeStateMap: store.state,
      );

      if (newToken == Settings.revalidateToken) {
        newToken = state.token;
      } else if (state.token == newToken) {
        return;
      }

      if (newToken?.isEmpty ?? true) {
        return store.dispatch(
          clearToken(),
        );
      }

      api_action.setToken(
        token: newToken!,
      );

      checkTokenSuccess({
        required Result result,
      }) async {
        _log('checkTokenSuccess').map('result', result).print();
      }

      checkTokenFailure({
        required Result result,
      }) async {
        _log('checkTokenFailure').map('result', result).print();

        return store.dispatch(
          clearToken(),
        );
      }

      store.dispatch(
        api_action.get(
          url: ApiUrl.checkToken.path,
          userFriendlyName: state.l10nGuiRitter!.loadingTag_validateAndSetToken,
          thenFunction: checkTokenSuccess,
          catchFunction: checkTokenFailure,
        ),
      );
    };

class AuthenticationAction {
  final String? token;

  const AuthenticationAction({
    required this.token,
  });
}
