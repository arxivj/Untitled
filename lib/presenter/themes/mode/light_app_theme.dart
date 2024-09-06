import 'package:flutter/material.dart';
import 'package:untitled/presenter/themes/app_theme.dart';
import 'package:untitled/presenter/themes/app_theme_styles.dart';
import 'package:untitled/presenter/themes/colors/app_theme_colors.dart';

class LightAppTheme extends AppTheme {
  LightAppTheme()
      : super(
          name: ThemeMode.light.name,
          brightness: Brightness.light,
          colors: AppThemeColors.fromAppColors(isDarkMode: false),
          styles: const AppThemeStyles(),
        );
}
