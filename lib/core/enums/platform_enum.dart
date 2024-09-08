enum PlatformEnum {
  google(key: 'google', token: 'idToken'),
  apple(key: 'apple', token: 'authorizationToken');

  final String key;
  final String token;

  const PlatformEnum({required this.key, required this.token});

  static PlatformEnum fromKey(String key) {
    return PlatformEnum.values.firstWhere((platform) => platform.key == key);
  }
}
