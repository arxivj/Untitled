import 'package:untitled/core/enums/auth_token_type.dart';

class TokenDTO {
  final String accessToken;
  final String refreshToken;

  TokenDTO({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() {
    return {
      AuthTokenType.accessToken.jsonKey: accessToken,
      AuthTokenType.refreshToken.jsonKey: refreshToken,
    };
  }

  factory TokenDTO.fromJson(Map<String, dynamic> json) {
    return TokenDTO(
      accessToken: json[AuthTokenType.accessToken.jsonKey],
      refreshToken: json[AuthTokenType.refreshToken.jsonKey],
    );
  }
}
