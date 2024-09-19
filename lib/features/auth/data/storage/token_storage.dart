import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/enums/auth_token_type.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';

class TokenStorage {
  Future<void> saveTokens(List<Token> tokens) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final accessToken = tokens.firstWhere((token) => token.type == AuthTokenType.accessToken);
    final refreshToken = tokens.firstWhere((token) => token.type == AuthTokenType.refreshToken);

    await prefs.setString(AuthTokenType.accessToken.jsonKey, accessToken.token);
    await prefs.setString(AuthTokenType.refreshToken.jsonKey, refreshToken.token);
  }

  Future<List<Token>> loadTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final accessToken = prefs.getString(AuthTokenType.accessToken.jsonKey);
    final refreshToken = prefs.getString(AuthTokenType.refreshToken.jsonKey);

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
    await prefs.remove(AuthTokenType.accessToken.jsonKey);
    await prefs.remove(AuthTokenType.refreshToken.jsonKey);
  }
}
