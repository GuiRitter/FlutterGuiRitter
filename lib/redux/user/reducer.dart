import 'package:flutter_guiritter/model/_import.dart' show StateModelWrapper;
import 'package:flutter_guiritter/redux/user/action.dart'
    show AuthenticationAction;
import 'package:redux/redux.dart' show TypedReducer, combineReducers;

final setTokenTypedReducer =
    TypedReducer<Map<String, dynamic>, AuthenticationAction>(
  setTokenReducer,
).call;

final userCombinedReducer = combineReducers<Map<String, dynamic>>(
  [
    setTokenTypedReducer,
  ],
);

Map<String, dynamic> setTokenReducer(
  Map<String, dynamic> stateModelMap,
  AuthenticationAction action,
) =>
    StateModelWrapper(
      storeStateMap: stateModelMap,
    ).copyWith(
      token: () => action.token,
    );
