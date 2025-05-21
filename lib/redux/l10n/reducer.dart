import 'package:flutter_guiritter/model/model.import.dart'
    show StateModelWrapper;
import 'package:flutter_guiritter/redux/l10n/action.dart' show L10nAction;
import 'package:redux/redux.dart' show TypedReducer, combineReducers;

Map<String, dynamic> Function(Map<String, dynamic>, dynamic)
    buildL10nCombinedReducer<AppLocalizationsLocalType>() =>
        combineReducers<Map<String, dynamic>>(
          [
            buildSetL10nTypedReducer<AppLocalizationsLocalType>(),
          ],
        );

Map<String, dynamic> Function(
    Map<String, dynamic> state, dynamic action) buildSetL10nTypedReducer<
        AppLocalizationsLocalType>() =>
    TypedReducer<Map<String, dynamic>, L10nAction<AppLocalizationsLocalType>>(
      setL10nReducer,
    ).call;

Map<String, dynamic> setL10nReducer<AppLocalizationsLocalType>(
  Map<String, dynamic> stateModelMap,
  L10nAction<AppLocalizationsLocalType> action,
) =>
    StateModelWrapper(
      storeStateMap: stateModelMap,
    ).copyWith(
      l10n: () => action.l10n,
      l10nGuiRitter: () => action.l10nGuiRitter,
    );
