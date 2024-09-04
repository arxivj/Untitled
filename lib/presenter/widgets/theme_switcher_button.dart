import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/theme_provider.dart';

class ThemeSwitcherButton extends StatelessWidget {
  static const IconData _lightThemeIcon = Icons.wb_sunny_outlined;
  static const IconData _darkThemeIcon = Icons.dark_mode_outlined;

  final VoidCallback onPressed;

  const ThemeSwitcherButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        ThemeMode.dark == themeProvider.themeMode
            ? _darkThemeIcon
            : _lightThemeIcon,
      ),
      iconSize: 25,
      constraints: const BoxConstraints(),
      splashRadius: 20,
    );
  }
}
