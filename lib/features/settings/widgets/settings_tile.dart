import 'package:flutter/material.dart';
import 'package:untitled/themes/extensions.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const SettingsTile({
    required this.icon,
    required this.title,
    super.key,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashFactory: InkRipple.splashFactory,
        onTap: onTap,
        child: ListTile(
          leading: Icon(icon, color: context.colors.textColor),
          title: Text(
            title,
            style: context.typographies.bodyLarge.copyWith(
              color: context.colors.textColor,
            ),
          ),
          subtitle: subtitle != null
              ? Text(subtitle!, style: context.typographies.bodySmall)
              : null,
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: context.colors.textColor,
          ),
        ),
      ),
    );
  }
}
