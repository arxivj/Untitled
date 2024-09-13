enum PlatformEnum {
  google(id: 'google', token: 'idToken'),
  apple(id: 'apple', token: 'authorizationToken');

  final String id;
  final String token;

  const PlatformEnum({required this.id, required this.token});

  static PlatformEnum fromId(String id) {
    return PlatformEnum.values.firstWhere((platform) => platform.id == id);
  }
}
