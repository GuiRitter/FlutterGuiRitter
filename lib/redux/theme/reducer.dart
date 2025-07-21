import 'package:flutter_guiritter/model/_import.dart' show StateModelWrapper;
import 'package:flutter_guiritter/redux/theme/action.dart'
    as theme_action_gui_ritter;
import 'package:redux/redux.dart' show TypedReducer, combineReducers;

final setCardBorderShapeRadiusTypedReducer = TypedReducer<Map<String, dynamic>,
    theme_action_gui_ritter.CardBorderShapeRadiusAction>(
  setCardBorderShapeRadiusReducer,
).call;

final setThemeTypedReducer =
    TypedReducer<Map<String, dynamic>, theme_action_gui_ritter.ThemeAction>(
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
  theme_action_gui_ritter.CardBorderShapeRadiusAction action,
) =>
    StateModelWrapper(
      storeStateMap: stateModelMap,
    ).withCardBorderShapeRadius(
      cardBorderShapeRadius: action.cardBorderShapeRadius,
    );

Map<String, dynamic> setThemeReducer(
  Map<String, dynamic> stateModelMap,
  theme_action_gui_ritter.ThemeAction action,
) =>
    StateModelWrapper(
      storeStateMap: stateModelMap,
    ).copyWith(
      themeMode: () => action.themeMode,
    );
