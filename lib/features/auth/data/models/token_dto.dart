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
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  List<Token> toDomain() {
    return [
      Token(token: accessToken, type: TokenType.access),
      Token(token: refreshToken, type: TokenType.refresh),
    ];
  }
}
