enum AuthUserFields {
  id(key: 'id'),
  email(key: 'email'),
  token(key: 'accessToken'),
  platform(key: 'platform');

  final String key;

  const AuthUserFields({required this.key});
}

class AuthUserDTO {
  final String id;
  final String email;
  final String token;
  final String platform;

  AuthUserDTO({
    required this.id,
    required this.email,
    required this.token,
    required this.platform,
  });

  factory AuthUserDTO.fromJson(Map<String, dynamic> json) {
    return AuthUserDTO(
      id: json[AuthUserFields.id.key],
      email: json[AuthUserFields.email.key],
      token: json[ AuthUserFields.token.key],
      platform: json[ AuthUserFields.platform.key],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      AuthUserFields.id.key: id,
      AuthUserFields.email.key: email,
      AuthUserFields.token.key: token,
      AuthUserFields.platform.key: platform,
    };
  }
}
