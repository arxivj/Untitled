import 'package:untitled/features/auth/domain/entities/user_entity.dart';

class OAuthUserEntity extends UserEntity {
  final String oauthId;
  final String oauthToken;

  OAuthUserEntity({
    required this.oauthId,
    required super.email,
    required this.oauthToken,
    required super.platform,
  });

  @override
  String toString() {
    return 'OAuthUserEntity(oauthId: $oauthId, email: $email, oauthToken: $oauthToken, platform: $platform)';
  }
}
