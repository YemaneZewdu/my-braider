import 'package:flutter/material.dart';

class HomeSliverAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeSliverAppBarState();
  }
}

class HomeSliverAppBarState extends State<HomeSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverAppBar(
        title: Text('myBraider'),
        floating: true,
        snap: true,
        backgroundColor: Colors.blue,
        expandedHeight: 150.0,
        flexibleSpace: FlexibleSpaceBar(
//          background: Image.asset('assets/test.jpg', fit: BoxFit.cover),
            background: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("first column item"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Left widget", textScaleFactor: 1.0),
                    Text("Right widget", textScaleFactor: 1.0),
                  ],
                ),
              ],
            ),
            title: Text('Welcome')
//            title: Text("flexibleSpace"),
            ),
      ),
    );
  }
}
