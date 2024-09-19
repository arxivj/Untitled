import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/enums/token_enum.dart';
import 'package:untitled/features/auth/domain/entities/token.dart';

class TokenStorage {
  Future<void> saveTokens(List<Token> tokens) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final accessToken = tokens.firstWhere((token) => token.type == TokenEnum.accessToken);
    final refreshToken = tokens.firstWhere((token) => token.type == TokenEnum.refreshToken);

    await prefs.setString('access_token', accessToken.token);
    await prefs.setString('refresh_token', refreshToken.token);
  }

  Future<List<Token>> loadTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final accessToken = prefs.getString(TokenEnum.accessToken.jsonKey);
    final refreshToken = prefs.getString(TokenEnum.refreshToken.jsonKey);

    if (accessToken != null && refreshToken != null) {
      return [
        Token(token: accessToken, type: TokenEnum.accessToken),
        Token(token: refreshToken, type: TokenEnum.refreshToken),
      ];
    } else {
      throw Exception('No tokens found');
    }
  }

  Future<void> clearTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(TokenEnum.accessToken.jsonKey);
    await prefs.remove(TokenEnum.refreshToken.jsonKey);
  }
}
