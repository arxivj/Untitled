import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/navigator_test_page.dart';
import 'package:untitled/provider/theme_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final switchDarkMode = Provider.of<ThemeProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const NavigatorTestPage(),
                ),
              );
            },
            child: const Icon(Icons.home, size: 100, color: Colors.blue),
          ),
          const SizedBox(height: 20),
          const Text(
            'Home Page',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
              onTap: () {
                switchDarkMode.toggleThemeMode();
              },
              child:
                  const Icon(Icons.dark_mode, size: 100, color: Colors.blue)),
        ],
      ),
    );
  }
}
