
import 'package:untitled/features/auth/data/models/token_dto.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';

abstract class TokenMapper {
  TokenDTO toDTO(List<Token> tokens);
  List<Token> toEntity(TokenDTO dto);
}