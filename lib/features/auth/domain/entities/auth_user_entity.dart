class AuthUserEntity {
  final String id;
  final String email;
  final String token;
  final String platform;

  AuthUserEntity({
    required this.id,
    required this.email,
    required this.token,
    required this.platform,
  });
}
