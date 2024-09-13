import 'package:untitled/core/enums/auth_user_fields.dart';
import 'package:untitled/core/enums/platform_enum.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';
import 'package:untitled/features/auth/domain/entities/oauth_user_entity.dart';

class OAuthUserDTO extends UserDTO<OAuthUserEntity, OAuthUserDTO> {
  final String id;
  final String token;

  OAuthUserDTO({
    required this.id,
    required super.email,
    required this.token,
    required super.platform,
  });

  factory OAuthUserDTO.fromJson(
      Map<String, dynamic> json, PlatformEnum platform) {
    final tokenFieldName = platform.token;
    final tokenValue = json[tokenFieldName];

    return OAuthUserDTO(
      id: json[AuthUserFields.oAuthId.key],
      email: json[AuthUserFields.email.key],
      token: tokenValue,
      platform: platform.id,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      AuthUserFields.oAuthId.key: id,
      AuthUserFields.email.key: email,
      AuthUserFields.oAuthToken.key: token,
      AuthUserFields.platform.key: platform,
    };
  }

  @override
  OAuthUserDTO fromEntity(OAuthUserEntity entity) {
    return OAuthUserDTO(
      id: entity.id,
      email: entity.email,
      token: entity.token,
      platform: entity.platform,
    );
  }
}
