import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:wolt_with_flutter/pages/restaurant_page.dart';

class MCard extends StatelessWidget {
  MCard({Key key, @required this.restoObject}) : super(key: key);

  final RestaurantObject restoObject;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              Container(
                width: 160,
                height: 110,
                child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    fit: BoxFit.cover,
                    imageUrl: restoObject.imageURL),
              ),
              Container(
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restoObject.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(restoObject.subtitle),
                    Container(
                      // margin: EdgeInsets.all(10),
                      child: Divider(
                        //TODO add a visible divider
                        // indent: 12,
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(restoObject.pricing),
                        Text(' • '),
                        Text('${restoObject.baseEstimate} min'),
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
                // TODO fix text positioning in the exclusivity banner/profile favorites
              )
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 2,
          // margin: EdgeInsets.all(10),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RestaurantPage(restoObject)));
        });
  }
}
