import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/chat.dart';
import 'package:untitled/pages/home.dart';
import 'package:untitled/pages/like.dart';
import 'package:untitled/pages/settings.dart';
import 'package:untitled/presenter/themes/mode/dark_app_theme.dart';
import 'package:untitled/presenter/themes/mode/light_app_theme.dart';
import 'package:untitled/provider/theme_provider.dart';
import 'package:untitled/widgets/navigation.dart';

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
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  List<Widget> pages = const [
    Home(),
    Like(),
    Chat(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('MainScreen'),
          elevation: 0,
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: pages[currentPageIndex],
        ),
        bottomNavigationBar: Navigation(
          currentPageIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
