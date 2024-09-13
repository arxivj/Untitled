import 'package:flutter/material.dart';
import 'package:untitled/core/utils/constants.dart';
import 'package:untitled/features/auth/presentation/pages/login_text_field.dart';
import 'package:untitled/themes/extensions.dart';

class TestLoginUi extends StatefulWidget {
  const TestLoginUi({super.key});

  @override
  State<TestLoginUi> createState() => _TestLoginUiState();
}

class _TestLoginUiState extends State<TestLoginUi> {
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
                onPressed: () {},
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
