import 'package:untitled/features/auth/domain/entities/auth_user_entity.dart';

abstract class AuthRepository<T> {
  Future<T> login(String platform);
  Future<T> requestToken(AuthUserEntity user);
}