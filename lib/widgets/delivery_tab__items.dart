import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:wolt_with_flutter/services/restaurantservice.dart';

class DeliveryItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10.0),
            children: RestaurantService().getRestaurants().map((object) {
              return _FeatureGridItem(restoObject: object); //Feature(photo);
            }).toList()));
  }
}

class _FeatureGridItem extends StatelessWidget {
  _FeatureGridItem({Key key, @required this.restoObject}) : super(key: key);

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
                Image.network(restoObject.imageURL,
                    width: 415, height: 245, fit: BoxFit.cover),
                Positioned(
                    bottom: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          restoObject.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          restoObject.subtitle,
                          style: TextStyle(
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
            margin: EdgeInsets.all(10),
          ),
        ]);
  }
}
