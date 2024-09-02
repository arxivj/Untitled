import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:untitled/presenter/colors/app_theme_colors.dart';
import 'package:untitled/presenter/themes/app_theme_typography.dart';
import 'package:untitled/utils/font_family.dart';

import 'app_theme_styles.dart';

class AppTheme extends ThemeExtension<AppTheme> {

  final String name;
  final String fontFamily;
  final Brightness brightness;
  // final AppThemeColors colors;
  // final AppThemeTypography typography;
  // final AppThemeStyles styles;

  AppTheme({
    required this.name,
    required this.brightness,
    // required this.colors,
    // this.styles = const AppThemeStyles(),
    // this.typography = const AppThemeTypography(),
    this.fontFamily = FontFamily.circularStd,
  });


  ThemeData get themeData =>
      ThemeData().copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.scaled,
            ),
            TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.scaled,
            ),
          },
        ),
      );


  @override
  ThemeExtension<AppTheme> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppTheme> lerp(covariant ThemeExtension<AppTheme>? other,
      double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
