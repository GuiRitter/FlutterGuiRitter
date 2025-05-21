import 'package:flutter/material.dart' show ThemeMode;
import 'package:redux/redux.dart' show Store;
import 'package:redux_thunk/redux_thunk.dart' show ThunkAction;

ThunkAction<Map<String, dynamic>> setTheme<AppLocalizationsLocalType>({
  required ThemeMode themeMode,
}) =>
    (
      Store<Map<String, dynamic>> store,
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
