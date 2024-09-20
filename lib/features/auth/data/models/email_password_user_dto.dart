import 'package:untitled/features/auth/data/models/user_dto.dart';
import 'package:untitled/features/auth/domain/entities/email_password_user_entity.dart';

class EmailPasswordUserDTO extends UserDTO {
  EmailPasswordUserDTO({
    required super.email,
    required super.platform,
  });

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({});
    return json;
  }

  factory EmailPasswordUserDTO.fromEntity(EmailPasswordUserEntity entity) {
    return EmailPasswordUserDTO(
      email: entity.email,
      platform: entity.platform,
    );
  }
}
