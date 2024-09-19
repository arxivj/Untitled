import 'package:untitled/core/enums/auth_user_field.dart';

class UserEntity {
  final String email;
  final String platform;

  UserEntity({
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
