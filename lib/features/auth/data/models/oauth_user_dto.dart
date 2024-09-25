import 'package:untitled/core/enums/auth_user_field.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';

class OAuthUserDTO extends UserDTO {
  final String oauthId;
  final String? oauthToken;

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

  factory OAuthUserDTO.fromJson(Map<String, dynamic> json) {
    return OAuthUserDTO(
      email: json[AuthUserField.email.jsonKey],
      platform: json[AuthUserField.platform.jsonKey],
      oauthId: json[AuthUserField.oAuthId.jsonKey],
      oauthToken: json[AuthUserField.oAuthToken.jsonKey],
    );
  }
}
