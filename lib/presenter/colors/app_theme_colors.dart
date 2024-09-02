import 'package:flutter/material.dart';
import 'package:untitled/presenter/colors/app_colors.dart';

// [AppThemeColors] : AppColors에 정의된 색상들을 사용하여 테마에 필요한 색상 팔레트를 구성
class AppThemeColors {
  final Color scaffoldBackground;
  final Color searchBarColor;
  final Color tabBarColor;
  final Color buttonColor;
  final Color buttonIconColor;
  final Color textColor;
  final Color titleColor;
  final Color surface;
  final Color error;
  final Color onPrimary;
  final Color onSecondary;
  final Color onBackground;
  final Color onSurface;
  final Color onError;

  const AppThemeColors({
    required this.scaffoldBackground,
    required this.searchBarColor,
    required this.tabBarColor,
    required this.buttonColor,
    required this.buttonIconColor,
    required this.textColor,
    required this.titleColor,
    required this.surface,
    required this.error,
    required this.onPrimary,
    required this.onSecondary,
    required this.onBackground,
    required this.onSurface,
    required this.onError,
  });

  static AppThemeColors fromAppColors({
    required bool isDarkMode,
  }) {
    return AppThemeColors(
      scaffoldBackground: isDarkMode
          ? AppColors.darkScaffoldBackground
          : AppColors.lightScaffoldBackground,
      searchBarColor: isDarkMode
          ? AppColors.darkSearchBarColor
          : AppColors.lightSearchBarColor,
      tabBarColor:
          isDarkMode ? AppColors.darkTabBarColor : AppColors.lightTabBarColor,
      buttonColor:
          isDarkMode ? AppColors.darkButtonColor : AppColors.lightButtonColor,
      buttonIconColor: isDarkMode
          ? AppColors.darkButtonIconColor
          : AppColors.lightButtonIconColor,
      textColor:
          isDarkMode ? AppColors.darkTextColor : AppColors.lightTextColor,
      titleColor:
          isDarkMode ? AppColors.darkTitleColor : AppColors.lightTitleColor,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onBackground: AppColors.onBackground,
      onSurface: AppColors.onSurface,
      onError: AppColors.onError,
    );
  }

  AppThemeColors lerp(covariant dynamic other, double t) {
    if (other is! AppThemeColors) {
      return this;
    }
    return AppThemeColors(
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      searchBarColor: Color.lerp(searchBarColor, other.searchBarColor, t)!,
      tabBarColor: Color.lerp(tabBarColor, other.tabBarColor, t)!,
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t)!,
      buttonIconColor: Color.lerp(buttonIconColor, other.buttonIconColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      error: Color.lerp(error, other.error, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
    );
  }
}
