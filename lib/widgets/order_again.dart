import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:wolt_with_flutter/services/restaurant_service.dart';

import '../constants.dart' as Constants;

class OrderAgain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.PADDING_LTRB,
      child: Container(
          height: 240,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
                  RestaurantService().getNumberOfRestaurants(3).map((object) {
                return _HistoryGridItem(restoObject: object); //Feature(photo);
              }).toList())),
    );
  }
}

class _HistoryGridItem extends StatelessWidget {
  _HistoryGridItem({Key key, @required this.restoObject}) : super(key: key);

  final RestaurantObject restoObject;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(restoObject.imageURL)),
            ),

            //TODO refactor to add aloading icon
            // child: Image.network(
            //   restoObject.imageURL,
            //   fit: BoxFit.cover,
            //   loadingBuilder: (BuildContext context, Widget child,
            //       ImageChunkEvent loadingProgress) {
            //     if (loadingProgress == null) return child;
            //     return Center(
            //       child: CircularProgressIndicator(
            //         value: loadingProgress.expectedTotalBytes != null
            //             ? loadingProgress.cumulativeBytesLoaded /
            //                 loadingProgress.expectedTotalBytes
            //             : null,
            //       ),
            //     );
            //   },
            // ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  restoObject.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(restoObject.subtitle),
                Row(
                  children: [
                    Text(restoObject.pricing),
                    Text(' * '),
                    Text('${restoObject.baseEstimate} min'),
                    Text(' * '),
                    Text(' :D '),
                    Text(restoObject.rating.toString()),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      // elevation: 2,
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}
