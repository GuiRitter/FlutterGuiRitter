import 'package:flutter/material.dart' show ThemeMode, ValueGetter;
import 'package:flutter_guiritter/common/_import.dart'
    show AppLocalizationsGuiRitter, StateKey;
import 'package:flutter_guiritter/model/_import.dart' show LoadingTagModel;
import 'package:redux/redux.dart' show Store;

class StateModelWrapper<AppLocalizationsLocalType> {
  final Map<String, dynamic> storeStateMap;

  StateModelWrapper({
    required this.storeStateMap,
  });

  AppLocalizationsLocalType? get l10n => getL10n(
        storeStateMap: storeStateMap,
      );

  set l10n(
    AppLocalizationsLocalType? l10n,
  ) =>
      setL10n(
        storeStateMap: storeStateMap,
        l10n: l10n,
      );

  AppLocalizationsGuiRitter? get l10nGuiRitter => getL10nGuiRitter(
        storeStateMap: storeStateMap,
      );

  set l10nGuiRitter(
    AppLocalizationsGuiRitter? l10nGuiRitter,
  ) =>
      setL10nGuiRitter(
        storeStateMap: storeStateMap,
        l10nGuiRitter: l10nGuiRitter,
      );

  List<LoadingTagModel> get loadingTagList => getLoadingTagList(
        storeStateMap: storeStateMap,
      );

  set loadingTagList(
    List<LoadingTagModel> loadingTagList,
  ) =>
      setLoadingTagList(
        storeStateMap: storeStateMap,
        loadingTagList: loadingTagList,
      );

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

  String? get token => getToken(
        storeStateMap: storeStateMap,
      );

  set token(
    String? token,
  ) =>
      setToken(
        storeStateMap: storeStateMap,
        token: token,
      );

  Map<String, dynamic> copyWith({
    ValueGetter<AppLocalizationsLocalType?>? l10n,
    ValueGetter<AppLocalizationsGuiRitter?>? l10nGuiRitter,
    ValueGetter<ThemeMode>? themeMode,
    ValueGetter<List<LoadingTagModel>>? loadingTagList,
    ValueGetter<String?>? token,
  }) =>
      buildNewMap(
        storeStateMap: storeStateMap,
        l10n: l10n,
        l10nGuiRitter: l10nGuiRitter,
        themeMode: themeMode,
        loadingTagList: loadingTagList,
        token: token,
      );

  Map<String, dynamic> withLoadingTagList({
    required List<LoadingTagModel> newLoadingTagList,
  }) =>
      copyWith(
        loadingTagList: () => loadingTagList + newLoadingTagList,
      );

  Map<String, dynamic> withoutLoadingTagList({
    required List<String> idList,
  }) {
    final newLoadingTagList = List<LoadingTagModel>.from(
      loadingTagList,
    );

    for (final id in idList) {
      final index = newLoadingTagList.indexWhere(
        LoadingTagModel.idEquals(
          id,
        ),
      );

      newLoadingTagList.removeAt(
        index,
      );
    }

    return copyWith(
      loadingTagList: () => newLoadingTagList,
    );
  }

  static Map<String, dynamic> buildNewMap<AppLocalizationsLocalType>({
    required Map<String, dynamic> storeStateMap,
    ValueGetter<AppLocalizationsLocalType?>? l10n,
    ValueGetter<AppLocalizationsGuiRitter?>? l10nGuiRitter,
    ValueGetter<ThemeMode>? themeMode,
    ValueGetter<List<LoadingTagModel>>? loadingTagList,
    ValueGetter<String?>? token,
  }) {
    final storeStateWrapperCurrent = StateModelWrapper(
      storeStateMap: storeStateMap,
    );

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

    return {
      ...storeStateMap,
      StateKey.l10n: newL10n,
      StateKey.l10nGuiRitter: newL10nGuiRitter,
      StateKey.themeMode: newThemeMode,
      StateKey.loadingTagList: newLoadingTagList,
      StateKey.token: newToken,
    };
  }

  static AppLocalizationsLocalType? getL10n<AppLocalizationsLocalType>({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.l10n] as AppLocalizationsLocalType?;

  static AppLocalizationsGuiRitter? getL10nGuiRitter({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.l10nGuiRitter] as AppLocalizationsGuiRitter?;

  static List<LoadingTagModel> getLoadingTagList({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.loadingTagList] as List<LoadingTagModel>;

  static ThemeMode getThemeMode({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.themeMode] as ThemeMode;

  static String? getToken({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.token] as String?;

  static List<LoadingTagModel> selectLoadingTagList(
    Store<Map<String, dynamic>> store,
  ) {
    final state = StateModelWrapper(
      storeStateMap: store.state,
    );

    return state.loadingTagList;
  }

  static setL10n<AppLocalizationsLocalType>({
    required Map<String, dynamic> storeStateMap,
    required AppLocalizationsLocalType? l10n,
  }) =>
      storeStateMap[StateKey.l10n] = l10n;

  static setL10nGuiRitter({
    required Map<String, dynamic> storeStateMap,
    required AppLocalizationsGuiRitter? l10nGuiRitter,
  }) =>
      storeStateMap[StateKey.l10nGuiRitter] = l10nGuiRitter;

  static setLoadingTagList({
    required Map<String, dynamic> storeStateMap,
    required List<LoadingTagModel> loadingTagList,
  }) =>
      storeStateMap[StateKey.loadingTagList] = loadingTagList;

  static setThemeMode({
    required Map<String, dynamic> storeStateMap,
    required ThemeMode themeMode,
  }) =>
      storeStateMap[StateKey.themeMode] = themeMode;

  static setToken({
    required Map<String, dynamic> storeStateMap,
    required String? token,
  }) =>
      storeStateMap[StateKey.token] = token;
}
