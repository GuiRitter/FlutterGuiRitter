import 'package:flutter_guiritter/model/_import.dart' show StateModelWrapperOld;
import 'package:flutter_guiritter/redux/theme/action.dart'
    show CardBorderShapeRadiusAction, ThemeAction;
import 'package:redux/redux.dart' show TypedReducer, combineReducers;

final setCardBorderShapeRadiusTypedReducer =
    TypedReducer<Map<String, dynamic>, CardBorderShapeRadiusAction>(
  setCardBorderShapeRadiusReducer,
).call;

final setThemeTypedReducer = TypedReducer<Map<String, dynamic>, ThemeAction>(
  setThemeReducer,
).call;

final themeCombinedReducer = combineReducers<Map<String, dynamic>>(
  [
    setCardBorderShapeRadiusTypedReducer,
    setThemeTypedReducer,
  ],
);

Map<String, dynamic> setCardBorderShapeRadiusReducer(
  Map<String, dynamic> stateModelMap,
  CardBorderShapeRadiusAction action,
) =>
    StateModelWrapperOld(
      storeStateMap: stateModelMap,
    ).withCardBorderShapeRadius(
      cardBorderShapeRadius: action.cardBorderShapeRadius,
    );

Map<String, dynamic> setThemeReducer(
  Map<String, dynamic> stateModelMap,
  ThemeAction action,
) =>
    StateModelWrapperOld(
      storeStateMap: stateModelMap,
    ).copyWith(
      themeMode: () => action.themeMode,
    );
