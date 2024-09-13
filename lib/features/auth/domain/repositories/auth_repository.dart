import 'package:untitled/core/enums/platform_enum.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepository {
  Future<UserEntity> login(PlatformEnum platform);
  Future<List<Token>> requestToken(UserEntity user);
}