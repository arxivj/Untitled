import 'package:untitled/features/auth/domain/entities/user_entity.dart';

class EmailPasswordUserEntity extends UserEntity {
  final String password;

  EmailPasswordUserEntity({
    required super.email,
    required this.password,
    required super.platform,
  });
}
