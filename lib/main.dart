import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:untitled/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:untitled/features/auth/data/service/email_password_login_service.dart';
import 'package:untitled/features/auth/data/service/oauth_login_service.dart';
import 'package:untitled/features/auth/data/service/token_service.dart';
import 'package:untitled/features/auth/di/auth_module.dart';
import 'package:untitled/features/auth/domain/repositories/auth_repository.dart';
import 'package:untitled/features/auth/domain/usecases/login_usecase.dart';
import 'package:untitled/features/auth/presentation/pages/login_page.dart';
import 'package:untitled/features/chat/presentation/pages/chat.dart';
import 'package:untitled/features/home/presentation/pages/home.dart';
import 'package:untitled/features/like/presentation/pages/like.dart';
import 'package:untitled/features/navigation/navigation.dart';
import 'package:untitled/features/settings/presentation/pages/settings.dart';
import 'package:untitled/providers/theme_provider.dart';
import 'package:untitled/themes/mode/dark_app_theme.dart';
import 'package:untitled/themes/mode/light_app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // ChangeNotifierProvider(create: (context) => UserSessionProvider()),
        ...AuthModule.providers,
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
      home: LoginPage(),
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
