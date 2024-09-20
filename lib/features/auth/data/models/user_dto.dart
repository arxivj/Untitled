import 'package:untitled/core/enums/auth_user_field.dart';

abstract class UserDTO {
  final String email;
  final String platform;

  UserDTO({
    required this.email,
    required this.platform,
  });

  Map<String, dynamic> toJson() {
    return {
      AuthUserField.email.jsonKey: email,
      AuthUserField.platform.jsonKey: platform,
    };
  }
}
