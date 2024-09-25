import 'package:untitled/core/enums/auth_user_field.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';

class EmailPasswordUserDTO extends UserDTO {
  EmailPasswordUserDTO({
    required super.email,
    required super.platform,
  });

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    return json;
  }

  factory EmailPasswordUserDTO.fromJson(Map<String, dynamic> json) {
    return EmailPasswordUserDTO(
      email: json[AuthUserField.email.jsonKey],
      platform: json[AuthUserField.platform.jsonKey],
    );
  }
}
