import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_guiritter/model/_import.dart' show StateModelWrapper;
import 'package:redux/redux.dart' show Store;

ThemeMode selectTheme(
  Store<Map<String, dynamic>> store,
) {
  final state = StateModelWrapper(
    storeStateMap: store.state,
  );

  return state.themeMode;
}
