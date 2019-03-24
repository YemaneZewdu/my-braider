import 'package:flutter/material.dart';
import 'package:my_braider/home/HomeListItem.dart';
import 'package:my_braider/home/HomeSliverAppBar.dart';
import 'package:my_braider/home/model/HomeItem.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  final List<Widget> _pages = <Widget>[
    new CustomScrollView(
      slivers: <Widget>[
        HomeSliverAppBar(),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return HomeListItem(getFakeUser(index));
          }, childCount: 15),
        ),
      ],
    ),
    Container(color: Colors.purple),
    Container(color: Colors.yellow),
    Container(color: Colors.cyan),
  ];

  int _selectedPageIndex = 0;
  PageController _pageController = PageController();

  void _onPageSelected(int index) {
    _pageController.animateToPage(index, duration: _kDuration, curve: _kCurve);

    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Welcome to myBraider"),
//      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        itemCount: _pages.length,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onPageSelected,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("Appointments"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}

User getFakeUser(int index) {
  User u = User();
  u.firstName = "John $index";
  u.displayName = "Awesome Braider $index";
  u.address = "1600 Pensylvania Ave. NW";
  u.coverPhotoUrl =
      "https://media1.fdncms.com/sacurrent/imager/u/original/2445474/10665167_961009080597312_8875901690001311835_n.jpg";
  u.ratings = 4.5;
  return u;
}
