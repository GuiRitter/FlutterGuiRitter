import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_guiritter/common/_import.dart' show StateKey;
import 'package:flutter_guiritter/model/state/_import.dart'
    show BaseStateModelWrapper;

mixin ThemeModeMixin on BaseStateModelWrapper {
  ThemeMode get themeMode => getThemeMode(
        storeStateMap: storeStateMap,
      );

  set themeMode(
    ThemeMode themeMode,
  ) =>
      setThemeMode(
        storeStateMap: storeStateMap,
        themeMode: themeMode,
      );

  static ThemeMode getThemeMode({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.themeMode] as ThemeMode;

  static setThemeMode({
    required Map<String, dynamic> storeStateMap,
    required ThemeMode themeMode,
  }) =>
      storeStateMap[StateKey.themeMode] = themeMode;
}
