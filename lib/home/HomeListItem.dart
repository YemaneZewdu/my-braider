import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_braider/home/model/user.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeListItem extends StatelessWidget {
  HomeListItem(this.user);

  final User user;

  void _showSnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _showSnackBar(context, "onTap ${user.displayName}");
              },
              onLongPress: () {
                _showSnackBar(context, "onLongPress ${user.displayName}");
              },
              child: Container(
                height: 200,
                width: screenWidth,
                child: CachedNetworkImage(
                  imageUrl: user.coverPhotoUrl,
                  fit: BoxFit.cover,
//            placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fadeOutDuration: Duration(seconds: 1),
                  fadeInDuration: Duration(seconds: 2),
                ),
              ),
            ),
            Text(
              user.displayName,
              textScaleFactor: 1.5,
            ),
            Text(user.address),
            Text("User ratings ${user.ratings}"),
            SmoothStarRating(
              starCount: 5,
              rating: 4.4,
            )
          ],
        ),
      ),
    );
  }
}
