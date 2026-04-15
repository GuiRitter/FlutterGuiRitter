import 'package:flutter_guiritter/model/_import.dart' show StateModelWrapper;
import 'package:flutter_guiritter/redux/theme/action.dart'
    show CardBorderShapeRadiusAction, CardColorAction, ThemeAction;
import 'package:redux/redux.dart' show TypedReducer, combineReducers;

final setCardBorderShapeRadiusTypedReducer =
    TypedReducer<Map<String, dynamic>, CardBorderShapeRadiusAction>(
  setCardBorderShapeRadiusReducer,
).call;

final setCardColorTypedReducer =
    TypedReducer<Map<String, dynamic>, CardColorAction>(
  setCardColorReducer,
).call;

final setThemeTypedReducer = TypedReducer<Map<String, dynamic>, ThemeAction>(
  setThemeReducer,
).call;

final themeCombinedReducer = combineReducers<Map<String, dynamic>>(
  [
    setCardBorderShapeRadiusTypedReducer,
    setCardColorTypedReducer,
    setThemeTypedReducer,
  ],
);

Map<String, dynamic> setCardBorderShapeRadiusReducer(
  Map<String, dynamic> stateModelMap,
  CardBorderShapeRadiusAction action,
) =>
    StateModelWrapper(
      storeStateMap: stateModelMap,
    ).copyWith(
      cardBorderShapeRadius: () => action.cardBorderShapeRadius,
    );

Map<String, dynamic> setCardColorReducer(
  Map<String, dynamic> stateModelMap,
  CardColorAction action,
) =>
    StateModelWrapper(
      storeStateMap: stateModelMap,
    ).copyWith(
      cardColor: () => action.cardColor,
    );

Map<String, dynamic> setThemeReducer(
  Map<String, dynamic> stateModelMap,
  ThemeAction action,
) =>
    StateModelWrapper(
      storeStateMap: stateModelMap,
    ).copyWith(
      themeMode: () => action.themeMode,
    );
