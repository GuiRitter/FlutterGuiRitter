import 'package:flutter_guiritter/common/common.import.dart'
    as common_gui_ritter show AppLocalizationsGuiRitter, l10nGuiRitter;
import 'package:redux/redux.dart' show Store;
import 'package:redux_thunk/redux_thunk.dart' show ThunkAction;

ThunkAction<Map<String, dynamic>> setL10n<AppLocalizationsLocalType>({
  required AppLocalizationsLocalType? l10n,
  required common_gui_ritter.AppLocalizationsGuiRitter? l10nGuiRitter,
}) =>
    (
      Store<Map<String, dynamic>> store,
    ) async {
      common_gui_ritter.l10nGuiRitter = l10nGuiRitter;

      return store.dispatch(
        L10nAction<AppLocalizationsLocalType>(
          l10n: l10n,
          l10nGuiRitter: l10nGuiRitter,
        ),
      );
    };

class L10nAction<AppLocalizationsLocalType> {
  final AppLocalizationsLocalType? l10n;
  final common_gui_ritter.AppLocalizationsGuiRitter? l10nGuiRitter;

  const L10nAction({
    required this.l10n,
    required this.l10nGuiRitter,
  });
}
