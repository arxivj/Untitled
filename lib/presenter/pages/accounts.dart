import 'package:flutter/material.dart';
import 'package:untitled/presenter/widgets/accounts/account_detail_card.dart';
import 'package:untitled/presenter/widgets/accounts/accounts_trade_history_card.dart';
import 'package:untitled/utils/constants.dart';

class AccountsWidget extends StatelessWidget {
  const AccountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tradeHistory = TradeHistory(
      stockName: 'Apple',
      stockSymbol: 'AAPL',
      tradePrice: '-20,000원',
      tradeChange: '-1.5%',
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacing.mediumHeight(),
          const Padding(
            padding: AppPadding.kHorizontalPadding,
            child: AccountDetailsCard(),
          ),
          Spacing.largeHeight(),
          TradeHistoryCard(tradeHistory: tradeHistory),
          Spacing.largeHeight(),
          TradeHistoryCard(tradeHistory: tradeHistory),
          Spacing.extraLargeHeight(),
        ],
      ),
    );
  }
}
