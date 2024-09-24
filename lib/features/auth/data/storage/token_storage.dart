import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/enums/local_storage_token_type.dart';
import 'package:untitled/features/auth/data/models/token_dto.dart';

class TokenStorage {
  Future<void> saveTokens(TokenDTO tokenDTO) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(LocalStorageTokenType.accessToken.storageKey, tokenDTO.accessToken);
    await prefs.setString(LocalStorageTokenType.refreshToken.storageKey, tokenDTO.refreshToken);
  }

  Future<TokenDTO> loadTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final accessToken = prefs.getString(LocalStorageTokenType.accessToken.storageKey);
    final refreshToken = prefs.getString(LocalStorageTokenType.refreshToken.storageKey);

    if (accessToken != null && refreshToken != null) {
      return TokenDTO(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
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
