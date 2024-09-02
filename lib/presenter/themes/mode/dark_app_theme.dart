import 'package:flutter/material.dart';
import 'package:untitled/presenter/themes/app_theme.dart';

class DarkAppTheme extends AppTheme {
  DarkAppTheme()
      : super(
          name: 'dark',
          brightness: Brightness.dark,
        );

  // DarkAppTheme()
  //     : super(
  //   name: 'dark',
  //   brightness: Brightness.dark,
  //   colors: AppThemeColors.fromAppColors(isDarkMode: true),
  //   styles: const AppThemeStyles(
  //     cardShadow: [
  //       BoxShadow(
  //         color: Color(0x4D000000),
  //         offset: Offset(0, 2),
  //         blurRadius: 4,
  //       ),
  //     ],
  //   ),
  // );

  @override
  ThemeData get themeData => super.themeData.copyWith();
}
