enum AuthUserField {
  email(jsonKey: 'email'),
  platform(jsonKey: 'platform'),
  oAuthId(jsonKey: 'oauthId'),
  oAuthToken(jsonKey: 'oauthToken'),
  password(jsonKey: 'password');

  final String jsonKey;

  const AuthUserField({required this.jsonKey});
}
