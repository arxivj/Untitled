import 'package:flutter/material.dart';
import 'package:untitled/presenter/themes/app_theme.dart';
import 'package:untitled/presenter/widgets/card_layout.dart';

class AccountDetailsCard extends StatelessWidget {
  const AccountDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 객체로 가져와야 하지만, 우선은 변수로
    // 참고로 계좌번호와 AppKey, AppSecret은 사용자 한테 입력 받아야됨
    const String accountNumber = '12345678-12';
    const String accountType = '위탁계좌';
    const String accountBalance = '14,000,000원';
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return CardLayout(
      borderRadius: BorderRadius.circular(14),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$accountNumber $accountType',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                  ),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              accountBalance,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
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
                child: const Icon(
                  Icons.arrow_drop_down,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        const Text(
          'Korea Won (KRW)',
          style: TextStyle(
            fontSize: 11,
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
