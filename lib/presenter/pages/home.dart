import 'package:flutter/material.dart';
import 'package:untitled/presenter/pages/home_appbar.dart';
import 'package:untitled/presenter/widgets/app_search_bar.dart';
import 'package:untitled/presenter/widgets/home/home_tab_bar_delegate.dart';
import 'package:untitled/presenter/widgets/keyboard.dart';
import 'package:untitled/utils/constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: DefaultTabController(
          length: 5,
          /*
           * SingleChildScrollView와의 차이점: NestedScrollView는 내부에 또 다른 스크롤 가능한 영역을 포함할 수 있는 스크롤 뷰
           * 동작 방식: SliverAppBar나 SliverPersistentHeader와 같은 외부 영역과 내부의 리스트나 콘텐츠(여기서는 body: customTabBarView())가 함께 스크롤 됨
           * 외부 영역이 화면에서 사라지거나 고정(pinned)되면, 그 이후에는 내부 영역만 계속 스크롤 됨
           * 요약: 스크롤 시, 외부(Sliver)와 내부 영역이 함께 스크롤 되다가, 외부 영역이 고정되거나 사라지면 내부 영역만 스크롤 됨
        */
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: _buildSearchBarSection(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: HomeTabBarDelegate(),
                ),
              ];
            },
            body: customTabBarView(),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBarSection() {
    return Padding(
      padding: AppPadding.kHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPadding.kVerticalSmallPadding,
            child: AppSearchBar(hintText: 'Search'),
          ),
        ],
      ),
    );
  }
}
