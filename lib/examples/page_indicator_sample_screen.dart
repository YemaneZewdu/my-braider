import 'package:flutter/material.dart';
import 'package:my_braider/common/widgets/dots_indicator.dart';

class PageIndicatorSampleScreen extends StatefulWidget {
  @override
  State createState() => new PageIndicatorSampleScreenState();
}

class PageIndicatorSampleScreenState
    extends State<PageIndicatorSampleScreen> {
  final _controller = new PageController();

  final List<Widget> _pages = <Widget>[
    Container(color: Colors.purple),
    Container(color: Colors.yellow),
    Container(color: Colors.cyan),
    Container(color: Colors.red),
    Container(color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index];
            },
          ),
          new Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: new Container(
              color: Colors.grey[800].withOpacity(0.2),
              padding: const EdgeInsets.all(20.0),
              child: new Center(
                child: new DotsIndicator(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageSelected: (int page) {
                    _controller.animateToPage(
                      page,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
