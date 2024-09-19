import 'package:untitled/core/enums/auth_user_field.dart';
import 'package:untitled/features/auth/domain/entities/user_entity.dart';

class EmailPasswordUserEntity extends UserEntity {
  final String password;

  EmailPasswordUserEntity({
    required super.email,
    required super.platform,
    required this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      AuthUserField.password.jsonKey: password,
    });
    return json;
  }
}
