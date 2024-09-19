import 'package:untitled/core/enums/auth_user_field.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';

class OAuthUserEntity extends UserEntity {
  final String oauthId;
  final String oauthToken;

  OAuthUserEntity({
    required super.email,
    required super.platform,
    required this.oauthId,
    required this.oauthToken,
  });

  @override
  String toString() {
    return 'OAuthUserEntity(oauthId: $oauthId, email: $email, oauthToken: $oauthToken, platform: $platform)';
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      AuthUserField.oAuthId.jsonKey: oauthId,
      AuthUserField.oAuthToken.jsonKey: oauthToken,
    });
    return json;
  }
}
