import 'package:flutter/material.dart';
import 'package:untitled/presenter/widgets/stock_detail/first_tab_screen.dart';
import 'package:untitled/presenter/widgets/stock_detail/stock_detail_flexible_space_bar.dart';
import 'package:untitled/presenter/widgets/stock_detail/stock_detail_tab_bar_delegate.dart';

class StockDetailPage extends StatefulWidget {
  const StockDetailPage({super.key});

  @override
  State<StockDetailPage> createState() => _StockDetailPageState();
}

class _StockDetailPageState extends State<StockDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: NestedScrollView(
            physics: const ClampingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  expandedHeight: 192,
                  forceElevated: innerBoxIsScrolled,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Theme.of(context)
                          .inputDecorationTheme
                          .prefixIconColor,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none,
                        color: Theme.of(context)
                            .inputDecorationTheme
                            .prefixIconColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star_border,
                        color: Theme.of(context)
                            .inputDecorationTheme
                            .prefixIconColor,
                      ),
                    ),
                  ],
                  flexibleSpace: StockDetailFlexibleSpaceBar(context),
                ),
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: const SliverPersistentHeader(
                    pinned: true,
                    delegate: TabBarDelegate(),
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                // SizedBox(height: 48),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const FirstTabScreen(),
                      Container(
                        color: Colors.redAccent,
                      ),
                      Container(
                        color: Colors.blue,
                      ),
                      Container(
                        color: Colors.green,
                      ),
                      Container(
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
