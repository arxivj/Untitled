import 'package:flutter/material.dart';

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TabBar(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        isScrollable: true,
        tabs: _buildTabs(context),
        indicatorWeight: 0,
        unselectedLabelColor: Theme.of(context).hintColor,
        labelColor: Theme.of(context).colorScheme.onSurface,
        indicatorColor: Theme.of(context).colorScheme.secondary,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  List<Widget> _buildTabs(BuildContext context) {
    List<String> tabTitles = ["Overview", "Financials", "News", "Orders", "Trading"];
    return tabTitles.map((title) => _buildTab(context, title)).toList();
  }

  Widget _buildTab(BuildContext context, String title) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(title),
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
