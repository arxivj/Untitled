import 'package:flutter/material.dart';

class CardLayout extends StatelessWidget {
  final Widget? title;
  final double titleSpacing; // 타이틀과 카드 사이의 간격
  final List<Widget> children;
  final EdgeInsetsGeometry padding; // 카드 내부의 패딩
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;

  const CardLayout({
    required this.children,
    this.title,
    this.titleSpacing = 16.0,
    super.key,
    this.padding = const EdgeInsets.all(12),
    this.backgroundColor = Colors.white,
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
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(14),
          ),
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
