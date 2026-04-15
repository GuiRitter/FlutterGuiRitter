import 'dart:ui' show Color;

import 'package:flutter_guiritter/common/_import.dart' show StateKey;
import 'package:flutter_guiritter/model/state/_import.dart'
    show BaseStateModelWrapper;

mixin CardColorMixin on BaseStateModelWrapper {
  Color? get cardColor => getCardColor(
        storeStateMap: storeStateMap,
      );

  set cardColor(
    Color? cardColor,
  ) =>
      setCardColor(
        storeStateMap: storeStateMap,
        cardColor: cardColor,
      );

  static Color? getCardColor({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.cardColor] as Color?;

  static setCardColor({
    required Map<String, dynamic> storeStateMap,
    required Color? cardColor,
  }) =>
      storeStateMap[StateKey.cardColor] = cardColor;
}
