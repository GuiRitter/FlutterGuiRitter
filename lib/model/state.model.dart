import 'package:flutter/material.dart' show ThemeMode, ValueGetter;
import 'package:flutter_guiritter/common/common.import.dart'
    show AppLocalizationsGuiRitter;
import 'package:flutter_guiritter/model/model.import.dart' show LoadingTagModel;
import 'package:redux/redux.dart' show Store;

class StateModel<AppLocalizationsLocalType> {
  final AppLocalizationsGuiRitter? l10nGuiRitter;
  final AppLocalizationsLocalType? l10n;
  final ThemeMode themeMode;
  final List<LoadingTagModel> loadingTagList;
  final String? token;

  StateModel({
    required this.l10nGuiRitter,
    required this.l10n,
    required this.themeMode,
    required this.loadingTagList,
    required String? token,
  }) : token = (token != '') ? token : null;

  StateModel copyWith({
    ValueGetter<AppLocalizationsGuiRitter?>? l10nGuiRitter,
    ValueGetter<AppLocalizationsLocalType?>? l10n,
    ValueGetter<ThemeMode>? themeMode,
    ValueGetter<List<LoadingTagModel>>? loadingTagList,
    ValueGetter<String?>? token,
  }) {
    final newL10nGuiRitter =
        (l10nGuiRitter != null) ? l10nGuiRitter.call() : this.l10nGuiRitter;

    final newL10n = (l10n != null) ? l10n.call() : this.l10n;

    final newThemeMode =
        (themeMode != null) ? themeMode.call() : this.themeMode;

    final newLoadingTagList =
        (loadingTagList != null) ? loadingTagList.call() : this.loadingTagList;

    final newToken = (token != null) ? token.call() : this.token;

    return StateModel(
      l10nGuiRitter: newL10nGuiRitter,
      l10n: newL10n,
      themeMode: newThemeMode,
      loadingTagList: newLoadingTagList,
      token: newToken,
    );
  }

  static bool selectIsL10nLoaded(
    Store<StateModel> store,
  ) =>
      (store.state.l10nGuiRitter != null) && (store.state.l10n != null);
}
