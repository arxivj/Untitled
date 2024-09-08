import 'package:untitled/core/enums/platform_enum.dart';
import 'package:untitled/features/auth/domain/entities/auth_user_entity.dart';

abstract class AuthRepository<T> {
  Future<T> login(PlatformEnum platform);
  Future<T> requestToken(AuthUserEntity user);
}