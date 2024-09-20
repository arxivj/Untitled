import 'package:untitled/features/auth/domain/entities/user_entity.dart';

class EmailPasswordUserEntity extends UserEntity {

  EmailPasswordUserEntity({
    required super.email,
    required super.platform,
  });

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({});
    return json;
  }
}
