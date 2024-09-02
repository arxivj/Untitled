import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  // 현재 테마 모드를 반환하는 getter
  ThemeMode get themeMode => _themeMode;

  // 테마 모드를 수동으로 설정할 때 사용할 메서드
  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;

    notifyListeners();
  }

  // 이전에 설정된 테마 모드를 로컬 저장소에서 불러올 때 사용할 메서드
  Future<void> loadThemeMode() async {
    // 로컬 저장소에서 테마 모드를 불러오는 로직을 여기에 추가하면 됨

    notifyListeners();
  }
}