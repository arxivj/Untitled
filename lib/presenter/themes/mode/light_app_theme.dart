import 'package:flutter/material.dart';
import 'package:untitled/presenter/themes/app_theme.dart';

class LightAppTheme extends AppTheme {
  @override
  ThemeData get themeData => super.themeData.copyWith(
        brightness: Brightness.light,
      );
}
