import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/features/auth/domain/entities/token_entity.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepository {
  Future<UserEntity> login(AuthPlatform platform);
  Future<List<TokenEntity>> requestToken(UserEntity user);
  Future<void> saveTokens(List<TokenEntity> tokens);
  Future<UserEntity> getUserInfo();
  Future<void> logout();
}