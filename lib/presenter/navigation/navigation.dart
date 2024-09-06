import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/theme_provider.dart';

class Navigation extends StatelessWidget {
  final int currentPageIndex;
  final ValueChanged<int> onDestinationSelected;

  const Navigation({
    required this.currentPageIndex,
    required this.onDestinationSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeProvider>(context).themeMode;

    Color lightSelectedColor = const Color(0xFF2d65e4);
    Color lightUnselectedColor = const Color(0xFF777e89);
    Color lightBackgroundColor = const Color(0xFFf8f8f8);

    Color darkSelectedColor = const Color(0xFF3981f6);
    Color darkUnselectedColor = const Color(0xFF909090);
    Color darkBackgroundColor = const Color(0xFF141414);

    Color selectedColor =
        themeMode == ThemeMode.dark ? darkSelectedColor : lightSelectedColor;
    Color unselectedColor = themeMode == ThemeMode.dark
        ? darkUnselectedColor
        : lightUnselectedColor;
    Color backgroundColor = themeMode == ThemeMode.dark
        ? darkBackgroundColor
        : lightBackgroundColor;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 0.1,
          ),
        ],
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 60,
          backgroundColor: backgroundColor,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  color: selectedColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                );
              }
              return TextStyle(color: unselectedColor, fontSize: 11);
            },
          ),
        ),
        child: NavigationBar(
          animationDuration: const Duration(milliseconds: 1200),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          selectedIndex: currentPageIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home, color: unselectedColor),
              selectedIcon: Icon(Icons.home, color: selectedColor),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite, color: unselectedColor),
              selectedIcon: Icon(Icons.favorite, color: selectedColor),
              label: 'Like',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat, color: unselectedColor),
              selectedIcon: Icon(Icons.chat, color: selectedColor),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings, color: unselectedColor),
              selectedIcon: Icon(Icons.settings, color: selectedColor),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
