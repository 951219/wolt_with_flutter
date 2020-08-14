import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:wolt_with_flutter/services/restaurantservice.dart';

//TODO convert to carousel so it would have a page indicator in the bottom and it would snap into place ,allowing scrolling one by one

class HeroBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 275,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
            children: RestaurantService().getRestaurants().map((object) {
              return _HeroGridItem(restoObject: object); //Feature(photo);
            }).toList()));
  }
}

class _HeroGridItem extends StatelessWidget {
  _HeroGridItem({Key key, @required this.restoObject}) : super(key: key);

  final RestaurantObject restoObject;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 415,
                  height: 245,
                  child: Image.network(
                    restoObject.imageURL,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    bottom: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          restoObject.title,
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                              )
                            ],
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          restoObject.subtitle,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                )
                              ],
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 5,
            margin: EdgeInsets.only(right: 20),
          ),
        ]);
  }
}
