import 'package:flutter/material.dart';
import 'package:my_braider/common/widgets/page_view_indicator_container.dart';

class UserDetailScreen extends StatefulWidget {
  @override
  State createState() => new UserDetailScreenState();
}

class UserDetailScreenState extends State<UserDetailScreen> {
  var tabTitles = ["Services", "Details", "Reviews", "Portfolio"];
  static final _controller = new PageController();

  static final List<Widget> _pages = <Widget>[
    Container(color: Colors.purple),
    Container(color: Colors.yellow),
    Container(color: Colors.cyan),
    Container(color: Colors.purple),
    Container(color: Colors.yellow),
    Container(color: Colors.cyan),
  ];

  PageView pageView = PageView.builder(
    controller: _controller,
    itemCount: _pages.length,
    itemBuilder: (BuildContext context, int index) {
      return _pages[index];
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: tabTitles.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background:
                      PageViewIndicatorContainer(pageView, _pages.length),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Text(tabTitles[0])),
                      Tab(icon: Text(tabTitles[1])),
                      Tab(icon: Text(tabTitles[2])),
                      Tab(icon: Text(tabTitles[3])),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Center(
            child: Text("Sample body text"),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
