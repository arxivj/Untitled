import 'package:flutter/material.dart';
import 'package:untitled/presenter/pages/accounts.dart';
import 'package:untitled/utils/constants.dart';

class HomeTabBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 48;

  @override
  double get maxExtent => 48;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: AppPadding.kVerticalSmallPadding,
      child: TabBar(
        padding: AppPadding.kHorizontalPadding,
        labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        isScrollable: true,
        tabs: _buildTabs(context),
      ),
    );
  }

  List<Widget> _buildTabs(BuildContext context) {
    List<String> tabTitles = [
      'Accounts',
      'Stocks',
      'News',
      'Untitled',
      'Untitled',
    ];
    return tabTitles
        .map((title) => Tab(child: _buildTabContent(context, title)))
        .toList();
  }

  Widget _buildTabContent(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Text(title),
    );
  }

  @override
  bool shouldRebuild(HomeTabBarDelegate oldDelegate) => false;
}

// 홈에서 탭바를 선택시 나타날 위젯 세팅 (home - body에서 사용 중)
Widget customTabBarView() {
  return TabBarView(
    children: [
      const AccountsWidget(),
      Container(color: Colors.green),
      Container(color: Colors.blue),
      Container(color: Colors.yellow),
      Container(color: Colors.orange),
    ],
  );
}
