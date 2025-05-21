import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_guiritter/model/model.import.dart'
    show StateModelWrapper;
import 'package:redux/redux.dart' show Store;

ThemeMode select(
  Store<Map<String, dynamic>> store,
) =>
    StateModelWrapper(
      storeStateMap: store.state,
    ).themeMode;
