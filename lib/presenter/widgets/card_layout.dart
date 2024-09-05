import 'package:flutter/material.dart';
import 'package:untitled/utils/constants.dart';

class CardLayout extends StatelessWidget {
  final Widget? title;
  final double titleSpacing; // 타이틀과 카드 사이의 간격
  final List<Widget> children;
  final EdgeInsetsGeometry padding; // 카드 내부의 패딩
  final BorderRadiusGeometry borderRadius;

  const CardLayout({
    required this.children,
    this.title,
    this.titleSpacing = AppDimensions.medium,
    super.key,
    this.padding = const EdgeInsets.all(12),
    this.borderRadius = const BorderRadius.all(Radius.circular(14)),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          title!,
          SizedBox(height: titleSpacing),
        ],
        Card(
          child: Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
