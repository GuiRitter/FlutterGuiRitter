import 'package:flutter_guiritter/model/_import.dart'
    show L10nModel, StateModelWrapper;
import 'package:redux/redux.dart' show Store;

L10nModel<AppLocalizationsLocalType> selectL10n<AppLocalizationsLocalType>(
  Store<Map<String, dynamic>> store,
) {
  final state = StateModelWrapper(
    storeStateMap: store.state,
  );

  return L10nModel<AppLocalizationsLocalType>(
    l10nGuiRitter: state.l10nGuiRitter,
    l10n: state.l10n,
  );
}
