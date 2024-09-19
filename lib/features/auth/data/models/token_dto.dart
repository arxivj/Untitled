import 'package:untitled/core/enums/auth_token_type.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';

class TokenDTO {
  final String accessToken;
  final String refreshToken;

  TokenDTO({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenDTO.fromJson(Map<String, dynamic> json) {
    return TokenDTO(
      accessToken: json[AuthTokenType.accessToken.jsonKey],
      refreshToken: json[AuthTokenType.refreshToken.jsonKey],
    );
  }

  List<Token> toDomain() {
    return [
      Token(token: accessToken, type: AuthTokenType.accessToken),
      Token(token: refreshToken, type: AuthTokenType.refreshToken),
    ];
  }
}
