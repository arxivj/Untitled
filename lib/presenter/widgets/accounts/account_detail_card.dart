import 'package:flutter/material.dart';
import 'package:untitled/presenter/themes/app_theme.dart';
import 'package:untitled/presenter/widgets/card_layout.dart';

class AccountDetailsCard extends StatelessWidget {
  const AccountDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 객체로 가져와야 하지만, 우선은 변수로
    const String accountNumber = '12345678-01';
    const String accountType = '위탁계좌';
    const String accountBalance = '14,000,000원';
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return CardLayout(
      backgroundColor: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(14),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$accountNumber $accountType',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: Theme.of(context).hintColor,
                fontSize: 11,
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.copy,
                    color: Colors.red,
                    size: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              accountBalance,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Container(
                decoration: BoxDecoration(
                  color: appTheme.colors.buttonColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: appTheme.colors.buttonIconColor,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Korea Won (KRW)',
          style: TextStyle(
            fontSize: 11,
            color: Theme.of(context).hintColor,
          ),
        ),
        const SizedBox(height: 16),
        const ActionButtonsBar(),
        const SizedBox(height: 8),
      ],
    );
  }
}

class ActionButtonsBar extends StatelessWidget {
  const ActionButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionButton(title: '거래내역', icon: Icons.swap_horiz),
          ActionButton(title: '이체', icon: Icons.compare_arrows),
          ActionButton(title: '채우기', icon: Icons.add_circle_outline),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const ActionButton({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: appTheme.colors.buttonColor,
            padding: const EdgeInsets.all(15),
            shape: const CircleBorder(),
          ),
          child: Icon(
            icon,
            color: appTheme.colors.buttonIconColor,
            size: 24,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: appTheme.colors.buttonIconColor,
          ),
        ),
      ],
    );
  }
}
