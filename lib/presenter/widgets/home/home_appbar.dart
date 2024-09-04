import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presenter/widgets/theme_switcher_button.dart';
import 'package:untitled/provider/theme_provider.dart';
import 'package:untitled/utils/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      centerTitle: false,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          width: 40,
          height: 40,
          margin: AppPadding.kLeftPadding,
          decoration: const BoxDecoration(
            color: Colors.black12,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person),
        ),
      ),
      title: ThemeSwitcherButton(
        onPressed: () => themeProvider.toggleThemeMode(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.bar_chart),
          onPressed: () {},
          constraints: const BoxConstraints(),
          splashRadius: 20,
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
          splashRadius: 20,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppSizes.kAppBarHeight;
}
