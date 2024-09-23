import 'package:untitled/core/enums/auth_user_field.dart';

abstract class UserEntity {
  final String email;
  final String platform;

  UserEntity({
    required this.email,
    required this.platform,
  });
}
