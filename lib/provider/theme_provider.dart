import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/presenter/core/exceptions.dart';

class ThemeProvider extends ChangeNotifier {
  static const String themeModeKey = 'themeMode';
  ThemeMode _themeMode = ThemeMode.light;
  SharedPreferences? _sharedPreferences;

  ThemeProvider() {
    initPreferences();
  }

  ThemeMode get themeMode => _themeMode;

  Future<void> initPreferences() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      loadSavedThemeMode();
    } catch (e) {
      throw ThemeProviderException(
        'Failed to initialize SharedPreferences: $e',
      );
    }
  }

  void loadSavedThemeMode() {
    if (_sharedPreferences == null) {
      throw ThemeProviderException('SharedPreferences is not initialized.');
    }

    try {
      final String? savedThemeMode =
          _sharedPreferences!.getString(themeModeKey);
      _themeMode = ThemeMode.values.firstWhere(
        (e) => e.name == savedThemeMode,
        orElse: () => ThemeMode.light,
      );
      notifyListeners();
    } catch (e) {
      throw ThemeProviderException('Failed to load saved theme mode: $e');
    }
  }

  void toggleThemeMode() {
    final newThemeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    setThemeMode(newThemeMode);
    saveThemeMode();
  }

  // 설정창에서 set만 해서 어떻게 변하는지 보고, save 하는 경우도 존재하기 떄문에 별도의 메서드로 분리해서 사용
  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  Future<void> saveThemeMode() async {
    if (_sharedPreferences == null) {
      throw ThemeProviderException('SharedPreferences is not initialized.');
    }

    try {
      await _sharedPreferences?.setString(themeModeKey, _themeMode.name);
    } catch (e) {
      throw ThemeProviderException('Failed to save theme mode: $e');
    }
  }
}
