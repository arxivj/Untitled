import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:untitled/presenter/themes/app_theme_styles.dart';
import 'package:untitled/presenter/themes/app_theme_typography.dart';
import 'package:untitled/presenter/themes/colors/app_theme_colors.dart';
import 'package:untitled/utils/font_family.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final String name;
  final String fontFamily;
  final Brightness brightness;
  final AppThemeColors colors;
  final AppThemeTypography typography;
  final AppThemeStyles styles;

  AppTheme({
    required this.name,
    required this.brightness,
    required this.colors,
    this.styles = const AppThemeStyles(),
    this.typography = const AppThemeTypography(),
    this.fontFamily = FontFamily.circularStd,
  });

  ColorScheme get baseColorScheme => brightness == Brightness.light
      ? const ColorScheme.light()
      : const ColorScheme.dark();

  ThemeData get themeData => ThemeData(
        useMaterial3: false,
        platform: TargetPlatform.iOS,
        extensions: [this], // this는 현재의 AppTheme 객체
        brightness: brightness,
        scaffoldBackgroundColor: colors.scaffoldBackground,
        hintColor: colors.onSurface,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textColor,
        ),
        textTheme: TextTheme(
          displayLarge: typography.displayLarge,
          displayMedium: typography.displayMedium,
          displaySmall: typography.displaySmall,
          headlineLarge: typography.headlineLarge,
          headlineMedium: typography.headlineMedium,
          headlineSmall: typography.headlineSmall,
          titleLarge: typography.titleLarge,
          titleMedium: typography.titleMedium,
          titleSmall: typography.titleSmall,
          bodyLarge: typography.bodyLarge,
          bodyMedium: typography.bodyMedium,
          bodySmall: typography.bodySmall,
          labelLarge: typography.labelLarge,
          labelMedium: typography.labelMedium,
          labelSmall: typography.labelSmall,
        ),
        searchBarTheme: SearchBarThemeData(
          backgroundColor: WidgetStateProperty.all(colors.searchBarColor),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: colors.tabBarColor,
          unselectedLabelColor: colors.onSurface.withOpacity(0.6),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: colors.buttonColor,
          textTheme: ButtonTextTheme.primary,
        ),
        iconTheme: IconThemeData(
          color: colors.buttonIconColor,
        ),
        colorScheme: baseColorScheme.copyWith(
          onPrimary: colors.onPrimary,
          secondary: colors.onSecondary,
          error: colors.error,
          surface: colors.surface,
          onError: colors.onError,
          onSurface: colors.onSurface,
        ),
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
        fontFamily: fontFamily,
      );

  @override
  AppTheme copyWith({
    String? name,
    Brightness? brightness,
    AppThemeColors? colors,
    AppThemeTypography? typography,
    AppThemeStyles? styles,
    String? fontFamily,
  }) {
    return AppTheme(
      name: name ?? this.name,
      brightness: brightness ?? this.brightness,
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
      styles: styles ?? this.styles,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      name: name,
      brightness: brightness,
      colors: colors.lerp(other.colors, t),
      typography: typography.lerp(other.typography, t),
      styles: styles,
      fontFamily: fontFamily,
    );
  }
}
