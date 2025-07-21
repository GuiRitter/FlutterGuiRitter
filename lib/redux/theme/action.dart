import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_guiritter/redux/main.reducer.dart' show dispatch;
import 'package:flutter_guiritter/util/_import.dart' show logger;
import 'package:redux/redux.dart' show Store;
import 'package:redux_thunk/redux_thunk.dart' show ThunkAction;

final _log = logger('theme.action.dart');

void setCardBorderShapeRadius({
  required double cardBorderShapeRadius,
}) {
  _log('setCardBorderShapeRadius')
      .raw('cardBorderShapeRadius', cardBorderShapeRadius)
      .print();

  dispatch(
    CardBorderShapeRadiusAction(
      cardBorderShapeRadius: cardBorderShapeRadius,
    ),
  );
}

ThunkAction<Map<String, dynamic>> setTheme<AppLocalizationsLocalType>({
  required ThemeMode themeMode,
}) =>
    (
      Store<Map<String, dynamic>> store,
    ) async =>
        store.dispatch(
          ThemeAction(
            themeMode: themeMode,
          ),
        );

class CardBorderShapeRadiusAction {
  final double cardBorderShapeRadius;

  const CardBorderShapeRadiusAction({
    required this.cardBorderShapeRadius,
  });
}

class ThemeAction {
  final ThemeMode themeMode;

  const ThemeAction({
    required this.themeMode,
  });
}
