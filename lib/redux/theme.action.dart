import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_guiritter/model/state.model.dart' show StateModel;
import 'package:redux/redux.dart' show Store;
import 'package:redux_thunk/redux_thunk.dart' show ThunkAction;

ThunkAction<StateModelLocalType> setTheme<AppLocalizationsLocalType,
        StateModelLocalType extends StateModel<AppLocalizationsLocalType>>({
  required ThemeMode themeMode,
}) =>
    (
      Store<StateModelLocalType> store,
    ) async =>
        store.dispatch(
          ThemeAction(
            themeMode: themeMode,
          ),
        );

class ThemeAction {
  final ThemeMode themeMode;

  const ThemeAction({
    required this.themeMode,
  });
}
