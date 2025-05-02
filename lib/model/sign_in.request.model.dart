import 'package:flutter_guiritter/model/model.import.dart'
    show BaseRequestModel;
import 'package:flutter_guiritter/util/util.import.dart' show hideSecret;

class SignInRequestModel implements BaseRequestModel {
  late String userId;
  late String password;

  SignInRequestModel({
    required this.userId,
    required this.password,
  });

  SignInRequestModel.fromJson(
    Map<String, dynamic> json,
  )   : userId = json['login'],
        password = json['password'];

  @override
  Map<String, dynamic> asLog() => <String, dynamic>{
        'userId': userId,
        'password': hideSecret(
          password,
        ),
      };

  @override
  Map<String, dynamic> toJson() => {
        'login': userId,
        'password': password,
      };
}
