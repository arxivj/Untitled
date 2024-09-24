import 'package:untitled/core/enums/auth_token_type.dart';
import 'package:untitled/features/auth/data/models/token_dto.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/mappers/token_mapper.dart';

class TokenMapperImpl implements TokenMapper {
  @override
  TokenDTO toDTO(List<Token> tokens) {
    final accessToken = tokens.firstWhere((token) => token.type == AuthTokenType.accessToken).token;
    final refreshToken = tokens.firstWhere((token) => token.type == AuthTokenType.refreshToken).token;

    return TokenDTO(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  @override
  List<Token> toEntity(TokenDTO dto) {
    return [
      Token(token: dto.accessToken, type: AuthTokenType.accessToken),
      Token(token: dto.refreshToken, type: AuthTokenType.refreshToken),
    ];
  }
}
