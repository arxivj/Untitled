import 'package:untitled/features/auth/data/models/token_dto.dart';
import 'package:untitled/features/auth/domain/entities/token_entity.dart';

abstract class TokenMapper {
  TokenDTO toDTO(List<TokenEntity> tokens);
  List<TokenEntity> toEntity(TokenDTO dto);
}