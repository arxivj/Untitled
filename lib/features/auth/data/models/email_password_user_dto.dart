import 'package:untitled/core/enums/auth_user_field.dart';
import 'package:untitled/features/auth/data/models/user_dto.dart';
import 'package:untitled/features/auth/domain/entities/email_password_user_entity.dart';

class EmailPasswordUserDTO extends UserDTO<EmailPasswordUserEntity, EmailPasswordUserDTO> {
  final String password;

  EmailPasswordUserDTO({
    required super.email,
    required this.password,
    required super.platform,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      AuthUserField.email.jsonKey: email,
      AuthUserField.password.jsonKey: password,
      AuthUserField.platform.jsonKey: platform,
    };
  }

  @override
  EmailPasswordUserDTO fromEntity(EmailPasswordUserEntity entity) {
    return EmailPasswordUserDTO(
      email: entity.email,
      password: entity.password,
      platform: entity.platform,
    );
  }
}
