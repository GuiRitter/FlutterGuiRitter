import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_guiritter/model/_import.dart' show StateModelWrapper;
import 'package:redux/redux.dart' show Store;

ThemeMode themeSelector(
  Store<Map<String, dynamic>> store,
) =>
    StateModelWrapper(
      storeStateMap: store.state,
    ).themeMode;
