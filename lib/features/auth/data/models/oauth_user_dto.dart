import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/core/enums/auth_user_field.dart';
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
    Map<String, dynamic> json,
    AuthPlatform platform,
  ) {
    final tokenFieldName = platform.tokenKey;
    final tokenValue = json[tokenFieldName];

    return OAuthUserDTO(
      oauthId: json[AuthUserField.oAuthId.jsonKey],
      email: json[AuthUserField.email.jsonKey],
      oauthToken: tokenValue,
      platform: platform.platformId,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      AuthUserField.oAuthId.jsonKey: oauthId,
      AuthUserField.email.jsonKey: email,
      AuthUserField.oAuthToken.jsonKey: oauthToken,
      AuthUserField.platform.jsonKey: platform,
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
