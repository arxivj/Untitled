import 'package:untitled/core/enums/auth_user_field.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';
import 'package:untitled/features/auth/domain/entities/oauth_user_entity.dart';

class OAuthUserDTO extends UserDTO {
  final String oauthId;
  final String oauthToken;

  OAuthUserDTO({
    required super.email,
    required super.platform,
    required this.oauthId,
    required this.oauthToken,
  });

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      AuthUserField.oAuthId.jsonKey: oauthId,
      AuthUserField.oAuthToken.jsonKey: oauthToken,
    });
    return json;
  }

  factory OAuthUserDTO.fromEntity(OAuthUserEntity entity) {
    return OAuthUserDTO(
      oauthId: entity.oauthId,
      email: entity.email,
      oauthToken: entity.oauthToken,
      platform: entity.platform,
    );
  }

// factory OAuthUserDTO.fromJson(
//   Map<String, dynamic> json,
//   AuthPlatform platform,
// ) {
//   final tokenFieldName = platform.tokenKey;
//   final tokenValue = json[tokenFieldName];
//
//   return OAuthUserDTO(
//     oauthId: json[AuthUserField.oAuthId.jsonKey],
//     email: json[AuthUserField.email.jsonKey],
//     oauthToken: tokenValue,
//     platform: platform.platformId,
//   );
// }
}
