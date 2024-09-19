import 'package:untitled/core/enums/auth_user_fields.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';

class EmailPasswordUserEntity extends UserEntity {
  final String password;

  EmailPasswordUserEntity({
    required super.email,
    required this.password,
    required super.platform,
  });

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      AuthUserFields.password.key: password,
    });
    return json;
  }
}
