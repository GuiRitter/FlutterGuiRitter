import 'dart:convert' show jsonDecode, jsonEncode;
import 'dart:ui' show Color;

import 'package:flutter/material.dart' show ThemeMode, ValueGetter;
import 'package:flutter_guiritter/common/_import.dart'
    show AppLocalizationsGuiRitter, StateKey;
import 'package:flutter_guiritter/model/_import.dart'
    show LoadingTagModel, Serializable;
import 'package:flutter_guiritter/model/state/_import.dart' as model_state;

class StateModelWrapper<AppLocalizationsLocalType>
    extends model_state.BaseStateModelWrapper
    with
        model_state.CardBorderShapeRadiusMixin,
        model_state.CardColorMixin,
        model_state.LoadingTagListMixin,
        model_state.L10nMixin<AppLocalizationsLocalType>,
        model_state.L10nGuiRitterMixin,
        model_state.ThemeModeMixin,
        model_state.TokenMixin
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
      StateKey.token: json[StateKey.token],
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
    ValueGetter<String?>? token,
    ValueGetter<double?>? cardBorderShapeRadius,
    ValueGetter<Color?>? cardColor,
  }) =>
      buildNewMap(
        storeStateMap: storeStateMap,
        l10n: l10n,
        l10nGuiRitter: l10nGuiRitter,
        themeMode: themeMode,
        loadingTagList: loadingTagList,
        token: token,
        cardBorderShapeRadius: cardBorderShapeRadius,
        cardColor: cardColor,
      );

  @override
  String serialize() => jsonEncode(
        {
          StateKey.l10n: null,
          StateKey.l10nGuiRitter: null,
          StateKey.themeMode: themeMode.name,
          StateKey.loadingTagList: <LoadingTagModel>[],
          StateKey.token: token,
        },
      );

  static Map<String, dynamic> buildNewMap<AppLocalizationsLocalType>({
    required Map<String, dynamic> storeStateMap,
    ValueGetter<AppLocalizationsLocalType?>? l10n,
    ValueGetter<AppLocalizationsGuiRitter?>? l10nGuiRitter,
    ValueGetter<ThemeMode>? themeMode,
    ValueGetter<List<LoadingTagModel>>? loadingTagList,
    ValueGetter<String?>? token,
    ValueGetter<double?>? cardBorderShapeRadius,
    ValueGetter<Color?>? cardColor,
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

    final newToken =
        (token != null) ? token.call() : storeStateWrapperCurrent.token;

    final newCardBorderShapeRadius = (cardBorderShapeRadius != null)
        ? cardBorderShapeRadius.call()
        : storeStateWrapperCurrent.cardBorderShapeRadius;

    final newCardColor = (cardColor != null)
        ? cardColor.call()
        : storeStateWrapperCurrent.cardColor;

    return {
      ...storeStateMap,
      StateKey.l10n: newL10n,
      StateKey.l10nGuiRitter: newL10nGuiRitter,
      StateKey.themeMode: newThemeMode,
      StateKey.loadingTagList: newLoadingTagList,
      StateKey.token: newToken,
      StateKey.cardBorderShapeRadius: newCardBorderShapeRadius,
      StateKey.cardColor: newCardColor,
    };
  }
}
