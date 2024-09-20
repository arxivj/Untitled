import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/core/enums/auth_token_type.dart';
import 'package:untitled/core/utils/constants.dart';
import 'package:untitled/features/auth/data/service/user_service.dart';
import 'package:untitled/features/auth/data/storage/token_storage.dart';
import 'package:untitled/features/auth/domain/usecases/logout_usecase.dart';
import 'package:untitled/features/auth/presentation/pages/login_page.dart';
import 'package:untitled/features/settings/widgets/settings_tile.dart';
import 'package:untitled/themes/app_theme.dart';
import 'package:untitled/widgets/shared/card_layout.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    final logoutUseCase = Provider.of<LogoutUseCase>(context, listen: false);
    final tokenStorage = Provider.of<TokenStorage>(context, listen: false);
    final userService = Provider.of<UserService>(context, listen: false);

    final tokens = await tokenStorage.loadTokens();
    final accessToken =
        tokens.firstWhere((token) => token.type == AuthTokenType.accessToken);

    final user = await userService.getUserByAccessToken(accessToken);

    await logoutUseCase(LogoutParams(user: user));
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: appTheme.typographies.headlineSmall),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.kContentPadding,
          child: Column(
            children: [
              CardLayout(
                children: [
                  SettingsTile(
                    icon: Icons.person,
                    title: 'Profile Settings',
                    subtitle: 'Edit your profile',
                    onTap: () {},
                  ),
                  SettingsTile(
                    icon: Icons.color_lens,
                    title: 'Theme',
                    onTap: () {},
                  ),
                  SettingsTile(
                    icon: Icons.language,
                    title: 'Language',
                    onTap: () {},
                  ),
                ],
              ),
              Spacing.mediumHeight(),
              CardLayout(
                children: [
                  SettingsTile(
                    icon: Icons.info_outline,
                    title: 'About Us',
                    onTap: () {},
                  ),
                  SettingsTile(
                    icon: Icons.contact_support,
                    title: 'Contact Support',
                    onTap: () {},
                  ),
                  SettingsTile(
                    icon: Icons.feedback,
                    title: 'Feedback',
                    onTap: () {},
                  ),
                  SettingsTile(
                    icon: Icons.security,
                    title: 'Security',
                    subtitle: 'Manage security settings',
                    onTap: () {},
                  ),
                  SettingsTile(
                    icon: Icons.info,
                    title: 'Version Info',
                    onTap: () {},
                  ),
                ],
              ),
              Spacing.mediumHeight(),
              CardLayout(
                children: [
                  SettingsTile(
                    icon: Icons.logout_rounded,
                    title: 'Logout',
                    onTap: () async {
                      await _handleLogout(context);
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _navigateToLogin(context);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
