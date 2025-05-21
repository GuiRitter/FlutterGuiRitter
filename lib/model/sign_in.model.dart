import 'package:flutter_guiritter/model/model.import.dart'
    show LoggableModel, StateModelWrapper;
import 'package:flutter_guiritter/util/util.import.dart' show hideSecret;
import 'package:redux/redux.dart' show Store;

class SignInModel<AppLocalizationsLocalType> implements LoggableModel {
  final String? token;

  SignInModel({
    required this.token,
  });

  @override
  int get hashCode => Object.hash(
        token,
        token,
      );

  @override
  bool operator ==(
    Object other,
  ) {
    if (other is! SignInModel<AppLocalizationsLocalType>) {
      return false;
    }
    if ((token == null) != (other.token == null)) {
      return false;
    }
    return token == other.token;
  }

  @override
  Map<String, dynamic> asLog() => <String, dynamic>{
        'token': hideSecret(
          token,
        ),
      };

  static SignInModel<AppLocalizationsLocalType>
      select<AppLocalizationsLocalType>(
    Store<Map<String, dynamic>> store,
  ) {
    final state = StateModelWrapper(
      storeStateMap: store.state,
    );

    return SignInModel<AppLocalizationsLocalType>(
      token: state.token,
    );
  }
}
