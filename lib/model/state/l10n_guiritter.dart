import 'package:flutter_guiritter/common/_import.dart'
    show AppLocalizationsGuiRitter, StateKey;
import 'package:flutter_guiritter/model/state/_import.dart'
    show BaseStateModelWrapper;

mixin L10nGuiRitterMixin on BaseStateModelWrapper {
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

  static AppLocalizationsGuiRitter? getL10nGuiRitter({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.l10nGuiRitter] as AppLocalizationsGuiRitter?;

  static setL10nGuiRitter({
    required Map<String, dynamic> storeStateMap,
    required AppLocalizationsGuiRitter? l10nGuiRitter,
  }) =>
      storeStateMap[StateKey.l10nGuiRitter] = l10nGuiRitter;
}
