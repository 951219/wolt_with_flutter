import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:wolt_with_flutter/services/restaurantservice.dart';
import '../constants.dart' as Constants;

//TODO categories data model and service

class CategoriesBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: Constants.PADDING_LTRB,
            children: RestaurantService().getRestaurants().map((object) {
              return _ExclusivityItem(restoObject: object); //Feature(photo);
            }).toList()));
  }
}

class _ExclusivityItem extends StatelessWidget {
  _ExclusivityItem({Key key, @required this.restoObject}) : super(key: key);

  final RestaurantObject restoObject;
  @override
  Widget build(BuildContext context) {
    return Card(
      // semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          Container(
            width: 120,
            height: 110,
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

          //TODO
          Container(
            height: 40,
            child: Text(
              restoObject.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 2,
      // margin: EdgeInsets.all(10),
    );
  }
}
