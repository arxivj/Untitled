import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presenter/themes/mode/dark_app_theme.dart';
import 'package:untitled/presenter/themes/mode/light_app_theme.dart';
import 'package:untitled/provider/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Untitled',
      themeMode: themeProvider.themeMode,
      theme: LightAppTheme().themeData,
      darkTheme: DarkAppTheme().themeData,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Home'),
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          child: const Center(
            child: Text(
              'Home',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
