import 'package:flutter_guiritter/model/_import.dart'
    show LoggableModel, StateModelWrapper;
import 'package:redux/redux.dart' show Store;

class InitModel<AppLocalizationsLocalType> implements LoggableModel {
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
    if (other is! InitModel<AppLocalizationsLocalType>) {
      return false;
    }
    return (isL10nLoaded == other.isL10nLoaded);
  }

  @override
  Map<String, dynamic> asLog() => <String, dynamic>{
        'isL10nLoaded': isL10nLoaded,
      };

  static InitModel<AppLocalizationsLocalType> select<AppLocalizationsLocalType>(
    Store<Map<String, dynamic>> store,
  ) {
    final state = StateModelWrapper(
      storeStateMap: store.state,
    );

    return InitModel<AppLocalizationsLocalType>(
      isL10nLoaded: (state.l10nGuiRitter != null) && (state.l10n != null),
    );
  }
}
