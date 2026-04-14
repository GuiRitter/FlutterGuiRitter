import 'package:flutter_guiritter/model/_import.dart' show SignInModel;
import 'package:flutter_guiritter/model/state/_import.dart'
    show StateModelWrapper;
import 'package:redux/redux.dart' show Store;

SignInModel<AppLocalizationsLocalType> selectSignIn<AppLocalizationsLocalType>(
  Store<Map<String, dynamic>> store,
) {
  final state = StateModelWrapper(
    storeStateMap: store.state,
  );

  return SignInModel<AppLocalizationsLocalType>(
    token: state.token,
  );
}
