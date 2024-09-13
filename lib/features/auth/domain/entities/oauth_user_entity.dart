import 'package:untitled/features/auth/domain/entities/user_entity.dart';

class OAuthUserEntity extends UserEntity {
  final String id;
  final String token;

  OAuthUserEntity({
    required this.id,
    required super.email,
    required this.token,
    required super.platform,
  });
}
