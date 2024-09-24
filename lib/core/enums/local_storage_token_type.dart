enum LocalStorageTokenType {
  accessToken('access_token'),
  refreshToken('refresh_token');

  final String storageKey;

  const LocalStorageTokenType(this.storageKey);
}