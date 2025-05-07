import 'package:flutter_guiritter/common/common.import.dart'
    show AppLocalizationsGuiRitter;
import 'package:flutter_guiritter/model/model.import.dart'
    show LoggableModel, StateModel;
import 'package:redux/redux.dart' show Store;

class L10nModel<AppLocalizationsLocalType,
        StateModelLocalType extends StateModel<AppLocalizationsLocalType>>
    implements LoggableModel {
  final AppLocalizationsGuiRitter? l10nGuiRitter;
  final AppLocalizationsLocalType? l10n;

  L10nModel({
    required this.l10nGuiRitter,
    required this.l10n,
  });

  @override
  int get hashCode => Object.hash(
        l10nGuiRitter,
        l10n,
      );

  @override
  bool operator ==(
    Object other,
  ) {
    if (other is! L10nModel<AppLocalizationsLocalType, StateModelLocalType>) {
      return false;
    }
    return (l10nGuiRitter == other.l10nGuiRitter) && (l10n == other.l10n);
  }

  @override
  Map<String, dynamic> asLog() => <String, dynamic>{
        'isSignedIn': l10nGuiRitter,
        'state': l10n,
      };

  static L10nModel<AppLocalizationsLocalType, StateModelLocalType> select<
          AppLocalizationsLocalType,
          StateModelLocalType extends StateModel<AppLocalizationsLocalType>>(
    Store<StateModelLocalType> store,
  ) =>
      L10nModel<AppLocalizationsLocalType, StateModelLocalType>(
        l10nGuiRitter: (store.state as StateModel<AppLocalizationsLocalType>)
            .l10nGuiRitter,
        l10n: (store.state as StateModel<AppLocalizationsLocalType>).l10n,
      );
}
