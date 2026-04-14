import 'package:flutter_guiritter/model/_import.dart' show SignInModel;
import 'package:flutter_guiritter/model/_import.dart' show StateModelWrapperOld;
import 'package:redux/redux.dart' show Store;

SignInModel<AppLocalizationsLocalType> selectSignIn<AppLocalizationsLocalType>(
  Store<Map<String, dynamic>> store,
) {
  final stateOld = StateModelWrapperOld(
    storeStateMap: store.state,
  );

  return SignInModel<AppLocalizationsLocalType>(
    token: stateOld.token,
  );
}
