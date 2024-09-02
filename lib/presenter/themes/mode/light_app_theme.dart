import 'package:flutter/material.dart';
import 'package:untitled/presenter/themes/app_theme.dart';

class LightAppTheme extends AppTheme {
  LightAppTheme() : super(
          name: 'light',
          brightness: Brightness.light,
        );

  // LightAppTheme()
  //     : super(
  //   name : 'light',
  //   brightness: Brightness.light,
  //   colors: AppThemeColors.fromAppColors(isDarkMode: false),
  //   styles: const AppThemeStyles(
  //     cardShadow: [
  //       BoxShadow(
  //         color: Color(0x29000000),
  //         offset: Offset(0, 2),
  //         blurRadius: 4,
  //       ),
  //     ],
  //   ),
  // );

  @override
  ThemeData get themeData => super.themeData.copyWith();
}
