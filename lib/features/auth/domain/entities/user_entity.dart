import 'package:untitled/core/enums/auth_platform.dart';

abstract class UserEntity {
  final String email;
  final AuthPlatform platform;

  UserEntity({
    required this.email,
    required this.platform,
  });
}
