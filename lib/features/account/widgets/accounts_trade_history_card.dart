import 'package:flutter/material.dart';
import 'package:untitled/features/stock_detail/presentation/pages/stock_detail_page.dart';
import 'package:untitled/themes/app_theme.dart';
import 'package:untitled/core/utils/constants.dart';
import 'package:untitled/widgets/shared/card_layout.dart';

class TradeHistory {
  final String stockName;
  final String stockSymbol;
  final String tradePrice;
  final String tradeChange;

  TradeHistory({
    required this.stockName,
    required this.stockSymbol,
    required this.tradePrice,
    required this.tradeChange,
  });
}

class TradeHistoryCard extends StatelessWidget {
  final TradeHistory tradeHistory;

  const TradeHistoryCard({
    required this.tradeHistory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;
    return Padding(
      padding: AppPadding.kHorizontalPadding,
      child: CardLayout(
        title: Text(
          'Trade History',
          style: appTheme.typographies.headlineMedium,
        ),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StockDetailPage(),
                ),
              );
            },
            child: Container(
              padding: AppPadding.kContentPadding,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: appTheme.colors.buttonColor,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          padding: AppPadding.smallPadding(),
                          child: Icon(
                            Icons.sell_outlined,
                            color: appTheme.colors.buttonIconColor,
                            size: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tradeHistory.stockName,
                            style: appTheme.typographies.titleSmall,
                          ),
                          Text(
                            tradeHistory.stockSymbol,
                            style: appTheme.typographies.bodySmall.copyWith(
                              color: appTheme.colors.error,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        tradeHistory.tradePrice,
                        style: appTheme.typographies.titleSmall,
                      ),
                      Text(
                        tradeHistory.tradeChange,
                        style: appTheme.typographies.bodySmall.copyWith(
                          color: appTheme.colors.error,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}