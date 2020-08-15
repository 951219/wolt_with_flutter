import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/category_object.dart';
import 'package:wolt_with_flutter/services/category_service.dart';
import '../constants.dart' as Constants;
import 'dart:math' as Math;

//TODO categories data model and service

class CategoriesBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: Constants.PADDING_LTRB,
            children: CategoryService().getCategories().map((object) {
              object.numberOfVenues = Math.Random().nextInt(15) + 1;
              return _CategoryGridItem(
                  categoryObject: object); //Feature(photo);
            }).toList()));
  }
}

class _CategoryGridItem extends StatelessWidget {
  _CategoryGridItem({Key key, @required this.categoryObject}) : super(key: key);

  final CategoryObject categoryObject;
//TODO if 1 place then say 'place' not places
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            height: 110,
            child: Image.network(
              categoryObject.imgUrl,
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

          //TODO text positioning,
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryObject.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${categoryObject.numberOfVenues.toString()} places'),
              ],
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
