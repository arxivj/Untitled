// 서버에서 받은 JSON 데이터를 Dart 객체로 변환하거나, Dart 객체를 JSON으로 변환하는 메서드를 가짐
// 비지니스 로직이 없고,
// 외부와의 상호작용을 할 떄 사용

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
