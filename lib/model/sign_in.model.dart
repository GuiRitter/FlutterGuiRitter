import 'package:flutter_guiritter/model/_import.dart' show Loggable;
import 'package:flutter_guiritter/util/_import.dart' show hideSecret;

/// Represents the token that authorizes the user.
/// It's not just a [String] because that allows it to be hidden in logs.
class SignInModel<AppLocalizationsLocalType> implements Loggable {
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
}
