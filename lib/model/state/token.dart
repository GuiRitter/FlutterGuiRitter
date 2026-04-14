import 'package:flutter_guiritter/common/_import.dart' show StateKey;
import 'package:flutter_guiritter/model/state/_import.dart'
    show BaseStateModelWrapper;

mixin TokenMixin on BaseStateModelWrapper {
  String? get token => getToken(
        storeStateMap: storeStateMap,
      );

  set token(
    String? token,
  ) =>
      setToken(
        storeStateMap: storeStateMap,
        token: token,
      );

  static String? getToken({
    required Map<String, dynamic> storeStateMap,
  }) =>
      storeStateMap[StateKey.token] as String?;

  static setToken({
    required Map<String, dynamic> storeStateMap,
    required String? token,
  }) =>
      storeStateMap[StateKey.token] = token;
}
