import 'package:flutter/material.dart';
import 'package:untitled/themes/app_theme.dart';
import 'package:untitled/themes/app_theme_styles.dart';
import 'package:untitled/themes/colors/app_theme_colors.dart';

class DarkAppTheme extends AppTheme {
  DarkAppTheme()
      : super(
          name: ThemeMode.dark.name,
          brightness: Brightness.dark,
          colors: AppThemeColors.fromAppColors(isDarkMode: true),
          styles: const AppThemeStyles(),
        );
}
