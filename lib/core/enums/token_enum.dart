enum TokenEnum {
  accessToken(jsonKey: 'access_token'),
  refreshToken(jsonKey: 'refresh_token');

  final String jsonKey;

  const TokenEnum({
    required this.jsonKey,
});

}