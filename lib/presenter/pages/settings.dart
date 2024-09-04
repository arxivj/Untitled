import 'package:flutter/material.dart';
import 'package:untitled/presenter/themes/app_theme.dart';
import 'package:untitled/presenter/widgets/card_layout.dart';
import 'package:untitled/presenter/widgets/settings/settings_tile.dart';
import 'package:untitled/utils/constants.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: appTheme.colors.textColor,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.kContentPadding,
          child: Column(
            children: [
              CardLayout(
                backgroundColor: Theme.of(context).cardColor,
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
                backgroundColor: Theme.of(context).cardColor,
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
                backgroundColor: Theme.of(context).cardColor,
                children: [
                  SettingsTile(
                    icon: Icons.logout_rounded,
                    title: 'Logout',
                    onTap: () {},
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
