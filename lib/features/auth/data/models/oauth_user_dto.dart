import 'package:untitled/core/enums/auth_user_fields.dart';
import 'package:untitled/core/enums/platform_enum.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';
import 'package:untitled/features/auth/domain/entities/oauth_user_entity.dart';

class OAuthUserDTO extends UserDTO<OAuthUserEntity, OAuthUserDTO> {
  final String oauthId;
  final String oauthToken;

  OAuthUserDTO({
    required this.oauthId,
    required super.email,
    required this.oauthToken,
    required super.platform,
  });

  factory OAuthUserDTO.fromJson(
      Map<String, dynamic> json, PlatformEnum platform) {
    final tokenFieldName = platform.token;
    final tokenValue = json[tokenFieldName];

    return OAuthUserDTO(
      oauthId: json[AuthUserFields.oAuthId.key],
      email: json[AuthUserFields.email.key],
      oauthToken: tokenValue,
      platform: platform.id,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      AuthUserFields.oAuthId.key: oauthId,
      AuthUserFields.email.key: email,
      AuthUserFields.oAuthToken.key: oauthToken,
      AuthUserFields.platform.key: platform,
    };
  }

  @override
  OAuthUserDTO fromEntity(OAuthUserEntity entity) {
    return OAuthUserDTO(
      oauthId: entity.oauthId,
      email: entity.email,
      oauthToken: entity.oauthToken,
      platform: entity.platform,
    );
  }
}
