import 'package:flutter_guiritter/model/_import.dart'
    show Loggable, StateModelWrapper;
import 'package:redux/redux.dart' show Store;

class InitModel<AppLocalizationsLocalType> implements Loggable {
  final bool isEveryInitDataLoaded;

  InitModel({
    required this.isEveryInitDataLoaded,
  });

  @override
  int get hashCode => isEveryInitDataLoaded.hashCode;

  @override
  bool operator ==(
    Object other,
  ) {
    if (other is! InitModel<AppLocalizationsLocalType>) {
      return false;
    }
    return (isEveryInitDataLoaded == other.isEveryInitDataLoaded);
  }

  @override
  Map<String, dynamic> asLog() => <String, dynamic>{
        'isL10nLoaded': isEveryInitDataLoaded,
      };

  static InitModel<AppLocalizationsLocalType> select<AppLocalizationsLocalType>(
    Store<Map<String, dynamic>> store,
  ) {
    final state = StateModelWrapper(
      storeStateMap: store.state,
    );

    return InitModel<AppLocalizationsLocalType>(
      isEveryInitDataLoaded: (state.l10nGuiRitter != null) &&
          (state.l10n != null) &&
          (state.cardBorderShapeRadius != null),
    );
  }
}
