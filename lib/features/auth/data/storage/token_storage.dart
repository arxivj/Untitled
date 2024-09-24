import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/enums/auth_token_type.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';

enum LocalStorageTokenType {
  accessToken('access_token'),
  refreshToken('refresh_token');

  final String storageKey;

  const LocalStorageTokenType(this.storageKey);
}

class TokenStorage {
  Future<void> saveTokens(List<Token> tokens) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final accessToken = tokens.firstWhere((token) => token.type == AuthTokenType.accessToken).token;
    final refreshToken = tokens.firstWhere((token) => token.type == AuthTokenType.refreshToken).token;

    await prefs.setString(LocalStorageTokenType.accessToken.storageKey, accessToken);
    await prefs.setString(LocalStorageTokenType.refreshToken.storageKey, refreshToken);
  }

  Future<List<Token>> loadTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final accessToken = prefs.getString(LocalStorageTokenType.accessToken.storageKey);
    final refreshToken = prefs.getString(LocalStorageTokenType.refreshToken.storageKey);

    if (accessToken != null && refreshToken != null) {
      return [
        Token(token: accessToken, type: AuthTokenType.accessToken),
        Token(token: refreshToken, type: AuthTokenType.refreshToken),
      ];
    } else {
      throw Exception('No tokens found');
    }
  }

  Future<void> clearTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(LocalStorageTokenType.accessToken.storageKey);
    await prefs.remove(LocalStorageTokenType.refreshToken.storageKey);
  }
}
