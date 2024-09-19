import 'package:untitled/core/enums/token_enum.dart';
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
      accessToken: json[TokenEnum.accessToken.jsonKey],
      refreshToken: json[TokenEnum.refreshToken.jsonKey],
    );
  }

  List<Token> toDomain() {
    return [
      Token(token: accessToken, type: TokenEnum.accessToken),
      Token(token: refreshToken, type: TokenEnum.refreshToken),
    ];
  }
}
