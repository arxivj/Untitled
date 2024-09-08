import 'package:untitled/core/enums/platform_enum.dart';

enum AuthUserFields {
  id,
  email,
  token,
  platform;
}


class AuthUserDTO {
  final AuthUserFields id;
  final String email;
  final String token;
  final PlatformEnum platform;

  AuthUserDTO({
    required this.id,
    required this.email,
    required this.token,
    required this.platform,
  });

  factory AuthUserDTO.fromJson(Map<String, dynamic> json, PlatformEnum platform) {
    final token = json[platform.token];

    return AuthUserDTO(
      id: json[AuthUserFields.id.name],
      email: json[AuthUserFields.email.name],
      token: token,
      platform: platform,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AuthUserFields.id.name: id,
      AuthUserFields.email.name: email,
      AuthUserFields.token.name: token,
      AuthUserFields.platform.name: platform.name,
    };
  }
}
