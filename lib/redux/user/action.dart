import 'package:flutter_guiritter/common/common.import.dart'
    show ApiUrl, Settings;
import 'package:flutter_guiritter/model/model.import.dart'
    show Result, SignInRequestModel, StateModel;
import 'package:flutter_guiritter/redux/api/action.dart' as api_action;
import 'package:flutter_guiritter/util/util.import.dart' show logger;
import 'package:redux/redux.dart' show Store;
import 'package:redux_thunk/redux_thunk.dart' show ThunkAction;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

final _log = logger('user.action');

ThunkAction<StateModel> clearToken() => (
      Store<StateModel> store,
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

ThunkAction<StateModel> signIn({
  required SignInRequestModel signInModel,
}) =>
    (
      Store<StateModel> store,
    ) async {
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
          userFriendlyName:
              store.state.l10nGuiRitter!.loadingTag_validateAndSetToken,
          thenFunction: signInSuccess,
          catchFunction: signInFailure,
        ),
      );
    };

ThunkAction<StateModel> signOut() => (
      Store<StateModel> store,
    ) async {
      _log('signOut').print();

      return store.dispatch(
        validateAndSetToken(
          newToken: null,
        ),
      );
    };

ThunkAction<StateModel> validateAndSetToken({
  required String? newToken,
}) =>
    (
      Store<StateModel> store,
    ) async {
      _log('validateAndSetToken').secret('newToken', newToken).print();

      if (newToken == Settings.revalidateToken) {
        newToken = store.state.token;
      } else if (store.state.token == newToken) {
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
          userFriendlyName:
              store.state.l10nGuiRitter!.loadingTag_validateAndSetToken,
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
