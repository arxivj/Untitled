import 'package:flutter/material.dart';
import 'package:untitled/presenter/themes/app_theme.dart';
import 'package:untitled/presenter/themes/app_theme_styles.dart';
import 'package:untitled/presenter/themes/colors/app_theme_colors.dart';
import 'package:untitled/presenter/themes/mode/app_theme_type.dart';

class DarkAppTheme extends AppTheme {
  DarkAppTheme()
      : super(
          name: AppThemeType.dark.name,
          brightness: Brightness.dark,
          colors: AppThemeColors.fromAppColors(isDarkMode: true),
          styles: const AppThemeStyles(),
        );
}
