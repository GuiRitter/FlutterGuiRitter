import 'package:flutter_guiritter/common/_import.dart' show StateKey;
import 'package:flutter_guiritter/model/state/_import.dart'
    show BaseStateModelWrapper;

mixin L10nMixin<AppLocalizationsLocalType> on BaseStateModelWrapper {
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

  static AppLocalizationsLocalType? getL10n<AppLocalizationsLocalType>({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.l10n] as AppLocalizationsLocalType?;

  static setL10n<AppLocalizationsLocalType>({
    required Map<String, dynamic> storeStateMap,
    required AppLocalizationsLocalType? l10n,
  }) =>
      storeStateMap[StateKey.l10n] = l10n;
}
