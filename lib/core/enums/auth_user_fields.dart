enum AuthUserFields {
  email(key: 'email'),
  platform(key: 'platform'),
  oAuthId(key: 'oauthId'),
  oAuthToken(key: 'oauthToken'),
  password(key: 'password');

  final String key;

  const AuthUserFields({required this.key});
}
