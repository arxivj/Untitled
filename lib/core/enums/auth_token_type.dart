enum AuthTokenType {
  accessToken(jsonKey: 'accessToken'),
  refreshToken(jsonKey: 'refreshToken');

  final String jsonKey;

  const AuthTokenType({
    required this.jsonKey,
});

}