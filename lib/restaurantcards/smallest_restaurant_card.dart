import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:wolt_with_flutter/pages/restaurant_page.dart';

class SmallestRestaurantCard extends StatelessWidget {
  SmallestRestaurantCard(
      {Key key, @required this.restoObject, this.showDeliveryPrice = false})
      : super(key: key);

  final RestaurantObject restoObject;
  final bool showDeliveryPrice;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(restoObject.imageURL)),
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
                      Container(
                          child: showDeliveryPrice
                              ? Text(
                                  ' • Delivery ${restoObject.baseDeliveryPrice.toString()} €')
                              : null),
                      Text(' • '),
                      Text(
                          '${restoObject.baseEstimate}-${restoObject.baseEstimate + 10} min'),
                      Text(' • '),
                      Container(
                          child: restoObject.rating >= 9
                              ? Text(' 😍 ')
                              : restoObject.rating >= 8
                                  ? Text(' 😀 ')
                                  : Text(' 😔 ')),
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
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RestaurantPage(restoObject)));
      },
    );
  }
}
