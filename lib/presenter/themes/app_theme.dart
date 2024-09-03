import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:untitled/presenter/themes/app_theme_styles.dart';
import 'package:untitled/presenter/themes/app_theme_typography.dart';
import 'package:untitled/presenter/themes/colors/app_colors.dart';
import 'package:untitled/presenter/themes/colors/app_theme_colors.dart';
import 'package:untitled/utils/font_family.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final String name;
  final String fontFamily;
  final Brightness brightness;
  final AppThemeColors colors;
  final AppThemeTypography typographies;
  final AppThemeStyles styles;

  AppTheme({
    required this.name,
    required this.brightness,
    required this.colors,
    this.styles = const AppThemeStyles(),
    this.typographies = const AppThemeTypography(),
    this.fontFamily = FontFamily.circularStd,
  });

  ColorScheme get baseColorScheme => brightness == Brightness.light
      ? const ColorScheme.light()
      : const ColorScheme.dark();

  ThemeData get themeData => ThemeData(
        useMaterial3: false,
        platform: TargetPlatform.iOS,
        extensions: [this],
        // this는 현재의 AppTheme 객체
        brightness: brightness,
        scaffoldBackgroundColor: colors.scaffoldBackground,
        hintColor: colors.onSurface,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.textColor,
        ),
        textTheme: TextTheme(
          displayLarge: typographies.displayLarge,
          displayMedium: typographies.displayMedium,
          displaySmall: typographies.displaySmall,
          headlineLarge: typographies.headlineLarge,
          headlineMedium: typographies.headlineMedium,
          headlineSmall: typographies.headlineSmall,
          titleLarge: typographies.titleLarge,
          titleMedium: typographies.titleMedium,
          titleSmall: typographies.titleSmall,
          bodyLarge: typographies.bodyLarge,
          bodyMedium: typographies.bodyMedium,
          bodySmall: typographies.bodySmall,
          labelLarge: typographies.labelLarge,
          labelMedium: typographies.labelMedium,
          labelSmall: typographies.labelSmall,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 42),
          filled: true,
          fillColor: colors.searchBarColor,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF797f88),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          prefixIconColor: const Color(0xFF797e89),
          suffixIconColor: colors.onSurface,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: colors.onSurface,
          unselectedLabelColor: AppColors.darkGrey,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: colors.onPrimary,
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
          indicatorSize: TabBarIndicatorSize.label,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          // InkWell 효과 제거
          splashFactory: NoSplash.splashFactory,
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
      typographies: typography ?? this.typographies,
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
      typographies: typographies.lerp(other.typographies, t),
      styles: styles,
      fontFamily: fontFamily,
    );
  }
}
