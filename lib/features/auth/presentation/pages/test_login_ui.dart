import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/enums/auth_platform.dart';
import 'package:untitled/core/utils/constants.dart';
import 'package:untitled/features/auth/domain/usecases/login_usecase.dart';
import 'package:untitled/features/auth/presentation/pages/login_text_field.dart';
import 'package:untitled/main.dart';
import 'package:untitled/themes/extensions.dart';

class TestLoginUi extends StatefulWidget {
  const TestLoginUi({super.key});

  @override
  State<TestLoginUi> createState() => _TestLoginUiState();
}

class _TestLoginUiState extends State<TestLoginUi> {
  bool _isLoading = false;
  String? _message;

  Future<void> _handleLogin(AuthPlatform platform, BuildContext context) async {
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
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('로그인 실패: $e')));
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: context.colors.textColor,
          ),
        ),
        body: Padding(
          padding: AppPadding.kHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                '로그인',
                style: context.typographies.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.textColor,
                ),
                textAlign: TextAlign.center,
              ),
              Spacing.largeHeight(),
              LoginTextField(
                onSaved: (String? value) {},
                validator: (String? value) {
                  return null;
                },
                hintText: '이메일',
                style: context.typographies.bodyLarge.copyWith(
                  color: context.colors.textColor,
                ),
              ),
              Spacing.smallHeight(),
              LoginTextField(
                onSaved: (String? value) {},
                validator: (String? value) {
                  return null;
                },
                hintText: '비밀번호',
                style: context.typographies.bodyLarge.copyWith(
                  color: context.colors.textColor,
                ),
              ),
              Spacing.mediumHeight(),
              ElevatedButton(
                onPressed: () {
                  _handleLogin(AuthPlatform.emailPassword, context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: context.colors.textColor,
                  textStyle: context.typographies.bodyLarge,
                ),
                child: Text(
                  '로그인',
                  style: context.typographies.bodyLarge.copyWith(
                    color: context.colors.onPrimary,
                  ),
                ),
              ),
              Spacing.smallHeight(),
              TextButton(
                onPressed: () {},
                child: Text(
                  '회원가입',
                  style: context.typographies.bodyLarge.copyWith(
                    color: context.colors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
