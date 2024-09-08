class ServerException implements Exception {}

class CacheException implements Exception {}

class ThemeProviderException implements Exception {
  final String message;

  ThemeProviderException(this.message);

  @override
  String toString() {
    return 'ThemeProviderException: $message';
  }
}
