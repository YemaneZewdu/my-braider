import 'package:flutter/material.dart';
import 'package:my_braider/common/widgets/dots_indicator.dart';

/// This is a helper Widget that takes a PageView as input
/// and displays dot indicators for multiple pages
///
class PageViewIndicatorContainer extends StatelessWidget {
  @required
  final PageView pageView;

  @required
  final int length;

  PageViewIndicatorContainer(this.pageView, this.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          pageView,
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.grey[800].withOpacity(0.1),
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: length < 2
                    ? SizedBox()
                    : DotsIndicator(
                        controller: pageView.controller,
                        itemCount: length,
                        onPageSelected: (int page) {
                          pageView.controller.animateToPage(
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
