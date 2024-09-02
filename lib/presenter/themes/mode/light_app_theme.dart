import 'package:flutter/material.dart';
import 'package:untitled/presenter/colors/app_theme_colors.dart';
import 'package:untitled/presenter/themes/app_theme.dart';
import 'package:untitled/presenter/themes/app_theme_styles.dart';
import 'package:untitled/presenter/themes/mode/app_theme_type.dart';

class LightAppTheme extends AppTheme {
  LightAppTheme()
      : super(
          name: AppThemeType.light.name,
          brightness: Brightness.light,
          colors: AppThemeColors.fromAppColors(isDarkMode: false),
          styles: const AppThemeStyles(),
        );
}
