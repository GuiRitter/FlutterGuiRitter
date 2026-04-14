import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_guiritter/model/_import.dart' show StateModelWrapperOld;
import 'package:redux/redux.dart' show Store;

ThemeMode selectTheme(
  Store<Map<String, dynamic>> store,
) {
  final stateOld = StateModelWrapperOld(
    storeStateMap: store.state,
  );

  return stateOld.themeMode;
}
