import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/core/enums/auth_user_field.dart';

abstract class UserDTO {
  final String email;
  final AuthPlatform platform;

  UserDTO({
    required this.email,
    required this.platform,
  });

  Map<String, dynamic> toJson() {
    final String platformIdentifier = platform.platformId;
    return {
      AuthUserField.email.jsonKey: email,
      AuthUserField.platform.jsonKey: platformIdentifier,
    };
  }
}
