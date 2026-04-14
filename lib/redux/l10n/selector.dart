import 'package:flutter_guiritter/model/_import.dart'
    show L10nModel, StateModelWrapperOld;
import 'package:redux/redux.dart' show Store;

L10nModel<AppLocalizationsLocalType> selectL10n<AppLocalizationsLocalType>(
  Store<Map<String, dynamic>> store,
) {
  final stateOld = StateModelWrapperOld(
    storeStateMap: store.state,
  );

  return L10nModel<AppLocalizationsLocalType>(
    l10nGuiRitter: stateOld.l10nGuiRitter,
    l10n: stateOld.l10n,
  );
}
