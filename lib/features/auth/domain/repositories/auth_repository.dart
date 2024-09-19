import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepository {
  Future<UserEntity> login(AuthPlatform platform);
  Future<List<Token>> requestToken(UserEntity user);
  Future<void> saveTokens(List<Token> tokens);
  Future<void> logout(UserEntity user);
}