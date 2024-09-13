enum AuthUserFields {
  email(key: 'email'),
  platform(key: 'platform'),
  oAuthId(key: 'id'),
  oAuthToken(key: 'token'),
  password(key: 'password');

  final String key;

  const AuthUserFields({required this.key});
}
