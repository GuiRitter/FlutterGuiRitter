import 'package:flutter_guiritter/model/model.import.dart'
    show LoggableModel, StateModel;
import 'package:flutter_guiritter/util/util.import.dart' show hideSecret;
import 'package:redux/redux.dart' show Store;

class SignInModel<AppLocalizationsLocalType,
        StateModelLocalType extends StateModel<AppLocalizationsLocalType>>
    implements LoggableModel {
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
    if (other is! SignInModel<AppLocalizationsLocalType, StateModelLocalType>) {
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

  static SignInModel<AppLocalizationsLocalType, StateModelLocalType> select<
          AppLocalizationsLocalType,
          StateModelLocalType extends StateModel<AppLocalizationsLocalType>>(
    Store<StateModelLocalType> store,
  ) =>
      SignInModel<AppLocalizationsLocalType, StateModelLocalType>(
        token: (store.state as StateModel<AppLocalizationsLocalType>).token,
      );
}
