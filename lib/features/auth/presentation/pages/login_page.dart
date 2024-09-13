import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/enums/platform_enum.dart';
import 'package:untitled/features/auth/domain/usecases/login_usecase.dart';
import 'package:untitled/features/auth/presentation/pages/test_login_ui.dart';
import 'package:untitled/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  String? _message;

  Future<void> _handleLogin(PlatformEnum platform, BuildContext context) async {
    setState(() {
      _isLoading = true;
      _message = null;
    });

    try {
      final loginUseCase = Provider.of<LoginUseCase>(context, listen: false);

      final tokens = await loginUseCase(LoginParams(platform: platform));
      setState(() {
        _message = '로그인 성공! 받은 토큰: $tokens';
      });

      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } catch (e) {
      setState(() {
        _message = '로그인 실패: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _isLoading
                  ? null
                  : () => _handleLogin(PlatformEnum.google, context),
              child: const Text('Google'),
            ),
            TextButton(
              onPressed: _isLoading
                  ? null
                  : () => _handleLogin(PlatformEnum.apple, context),
              child: const Text('Apple'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TestLoginUi()),
                );
              },
              child: const Text('Test Login UI'),
            ),
            if (_message != null) Text(_message!),
            if (_isLoading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
