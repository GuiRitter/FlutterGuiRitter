import 'package:flutter_guiritter/model/model.import.dart'
    show LoggableModel, StateModel;
import 'package:redux/redux.dart' show Store;

class InitModel<AppLocalizationsLocalType,
        StateModelLocalType extends StateModel<AppLocalizationsLocalType>>
    implements LoggableModel {
  final bool isL10nLoaded;

  InitModel({
    required this.isL10nLoaded,
  });

  @override
  int get hashCode => isL10nLoaded.hashCode;

  @override
  bool operator ==(
    Object other,
  ) {
    if (other is! InitModel<AppLocalizationsLocalType, StateModelLocalType>) {
      return false;
    }
    return (isL10nLoaded == other.isL10nLoaded);
  }

  @override
  Map<String, dynamic> asLog() => <String, dynamic>{
        'isL10nLoaded': isL10nLoaded,
      };

  static InitModel<AppLocalizationsLocalType, StateModelLocalType> select<
          AppLocalizationsLocalType,
          StateModelLocalType extends StateModel<AppLocalizationsLocalType>>(
    Store<StateModelLocalType> store,
  ) =>
      InitModel<AppLocalizationsLocalType, StateModelLocalType>(
        isL10nLoaded: ((store.state as StateModel<AppLocalizationsLocalType>)
                    .l10nGuiRitter !=
                null) &&
            ((store.state as StateModel<AppLocalizationsLocalType>).l10n !=
                null),
      );
}
