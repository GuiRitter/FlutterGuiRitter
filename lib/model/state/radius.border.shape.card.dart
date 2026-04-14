import 'package:flutter_guiritter/common/_import.dart' show StateKey;
import 'package:flutter_guiritter/model/state/_import.dart'
    show BaseStateModelWrapper;

mixin CardBorderShapeRadiusMixin on BaseStateModelWrapper {
  double? get cardBorderShapeRadius => getCardBorderShapeRadius(
        storeStateMap: storeStateMap,
      );

  set cardBorderShapeRadius(
    double? cardBorderShapeRadius,
  ) =>
      setCardBorderShapeRadius(
        storeStateMap: storeStateMap,
        cardBorderShapeRadius: cardBorderShapeRadius,
      );

  static double? getCardBorderShapeRadius({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.cardBorderShapeRadius] as double?;

  static setCardBorderShapeRadius({
    required Map<String, dynamic> storeStateMap,
    required double? cardBorderShapeRadius,
  }) =>
      storeStateMap[StateKey.cardBorderShapeRadius] = cardBorderShapeRadius;
}
