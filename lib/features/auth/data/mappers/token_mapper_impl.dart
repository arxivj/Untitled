import 'package:untitled/core/enums/auth_token_type.dart';
import 'package:untitled/features/auth/data/models/token_dto.dart';
import 'package:untitled/features/auth/domain/entities/token_entity.dart';
import 'package:untitled/features/auth/domain/mappers/token_mapper.dart';

class TokenMapperImpl implements TokenMapper {
  @override
  TokenDTO toDTO(List<TokenEntity> tokens) {
    final accessToken = tokens.firstWhere((token) => token.type == AuthTokenType.accessToken).value;
    final refreshToken = tokens.firstWhere((token) => token.type == AuthTokenType.refreshToken).value;

    return TokenDTO(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  @override
  List<TokenEntity> toEntity(TokenDTO dto) {
    return [
      TokenEntity(value: dto.accessToken, type: AuthTokenType.accessToken),
      TokenEntity(value: dto.refreshToken, type: AuthTokenType.refreshToken),
    ];
  }
}
