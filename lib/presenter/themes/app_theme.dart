import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  ThemeData get themeData => ThemeData().copyWith(
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
  ThemeExtension<AppTheme> lerp(
      covariant ThemeExtension<AppTheme>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
