import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:flutter/material.dart' show ThemeMode, ValueGetter;
import 'package:flutter_guiritter/common/_import.dart'
    show AppLocalizationsGuiRitter, StateKey;
import 'package:flutter_guiritter/model/_import.dart'
    show LoadingTagModel, Serializable;
import 'package:flutter_guiritter/model/state/_import.dart' as model_state;

class StateModelWrapper<AppLocalizationsLocalType>
    extends model_state.BaseStateModelWrapper
    with
        model_state.LoadingTagListMixin,
        model_state.L10nMixin<AppLocalizationsLocalType>,
        model_state.L10nGuiRitterMixin,
        model_state.ThemeModeMixin
    implements Serializable {
  StateModelWrapper({
    required super.storeStateMap,
  });

  factory StateModelWrapper.deserialize({
    required String serialized,
  }) {
    final json = jsonDecode(
      serialized,
    );

    // TODO move each one to their respective namespace
    final storeStateMap = {
      StateKey.l10n: null,
      StateKey.l10nGuiRitter: null,
      StateKey.themeMode: ThemeMode.values.byName(
        json[StateKey.themeMode],
      ),
      StateKey.loadingTagList: <LoadingTagModel>[],
    };

    return StateModelWrapper(
      storeStateMap: storeStateMap,
    );
  }

  Map<String, dynamic> copyWith({
    ValueGetter<AppLocalizationsLocalType?>? l10n,
    ValueGetter<AppLocalizationsGuiRitter?>? l10nGuiRitter,
    ValueGetter<ThemeMode>? themeMode,
    ValueGetter<List<LoadingTagModel>>? loadingTagList,
  }) =>
      buildNewMap(
        storeStateMap: storeStateMap,
        l10n: l10n,
        l10nGuiRitter: l10nGuiRitter,
        themeMode: themeMode,
        loadingTagList: loadingTagList,
      );

  @override
  String serialize() => jsonEncode(
        {
          StateKey.l10n: null,
          StateKey.l10nGuiRitter: null,
          StateKey.themeMode: themeMode.name,
          StateKey.loadingTagList: <LoadingTagModel>[],
        },
      );

  static Map<String, dynamic> buildNewMap<AppLocalizationsLocalType>({
    required Map<String, dynamic> storeStateMap,
    ValueGetter<AppLocalizationsLocalType?>? l10n,
    ValueGetter<AppLocalizationsGuiRitter?>? l10nGuiRitter,
    ValueGetter<ThemeMode>? themeMode,
    ValueGetter<List<LoadingTagModel>>? loadingTagList,
  }) {
    final storeStateWrapperCurrent = StateModelWrapper(
      storeStateMap: storeStateMap,
    );

    // TODO move each one to their respective namespace
    final newL10n =
        (l10n != null) ? l10n.call() : storeStateWrapperCurrent.l10n;

    final newL10nGuiRitter = (l10nGuiRitter != null)
        ? l10nGuiRitter.call()
        : storeStateWrapperCurrent.l10nGuiRitter;

    final newThemeMode = (themeMode != null)
        ? themeMode.call()
        : storeStateWrapperCurrent.themeMode;

    final newLoadingTagList = (loadingTagList != null)
        ? loadingTagList.call()
        : List<LoadingTagModel>.from(
            storeStateWrapperCurrent.loadingTagList,
          );

    return {
      ...storeStateMap,
      StateKey.l10n: newL10n,
      StateKey.l10nGuiRitter: newL10nGuiRitter,
      StateKey.themeMode: newThemeMode,
      StateKey.loadingTagList: newLoadingTagList,
    };
  }
}
