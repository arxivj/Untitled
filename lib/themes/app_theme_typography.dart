import 'package:flutter/material.dart';

class AppThemeTypography {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  const AppThemeTypography({
    // 커스터마이징이 필요할 경우 사용하기 위해 직접 설정
    this.displayLarge =
        const TextStyle(fontSize: 57, fontWeight: FontWeight.w400),
    this.displayMedium =
        const TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
    this.displaySmall =
        const TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
    this.headlineLarge =
        const TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
    this.headlineMedium =
        const TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
    this.headlineSmall =
        const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
    this.titleLarge =
        const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    this.titleMedium =
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    this.titleSmall =
        const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    this.bodyLarge = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    this.bodyMedium =
        const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    this.bodySmall = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    this.labelLarge =
        const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    this.labelMedium =
        const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    this.labelSmall =
        const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
  });

  AppThemeTypography lerp(covariant dynamic other, double t) {
    if (other is! AppThemeTypography) return this;

    return AppThemeTypography(
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t)!,
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
    );
  }
}
