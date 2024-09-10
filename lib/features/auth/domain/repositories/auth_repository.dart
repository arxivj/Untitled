import 'package:untitled/core/enums/platform_enum.dart';
import 'package:untitled/features/auth/domain/entities/auth_user_entity.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';

abstract interface class AuthRepository {
  Future<AuthUserEntity> login(PlatformEnum platform);
  Future<List<Token>> requestToken(AuthUserEntity user);
}