enum AuthPlatform {
  google(platformId: 'google', tokenKey: 'idToken'),
  apple(platformId: 'apple', tokenKey: 'authorizationToken'),
  emailPassword(platformId: 'emailPassword', tokenKey: null);

  final String platformId;
  final String? tokenKey;

  const AuthPlatform({required this.platformId, required this.tokenKey});

  static AuthPlatform fromId(String id) {
    return AuthPlatform.values.firstWhere((platform) => platform.platformId == id);
  }
}
