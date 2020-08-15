import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';

class SmallestRestaurantCard extends StatelessWidget {
  SmallestRestaurantCard({Key key, @required this.restoObject})
      : super(key: key);

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
                    Text(' • '),
                    Text(
                        '${restoObject.baseEstimate}-${restoObject.baseEstimate + 10} min'),
                    Text(' • '),
                    Container(
                        child: restoObject.rating >= 9
                            ? Text(' 😍 ')
                            : Text(' 😀 ')),
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
