import 'package:untitled/core/enums/auth_user_fields.dart';

class UserEntity {
  final String email;
  final String platform;

  UserEntity({
    required this.email,
    required this.platform,
  });

  Map<String, dynamic> toJson() {
    return {
      AuthUserFields.email.key: email,
      AuthUserFields.platform.key: platform,
    };
  }
}
