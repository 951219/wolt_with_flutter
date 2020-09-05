import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/category_object.dart';
import 'package:wolt_with_flutter/restaurantcards/s_card.dart';
import '../constants.dart' as constants;

class SBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: FutureBuilder(
        future: constants.categories,
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryObject>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
                scrollDirection: Axis.horizontal,
                padding: constants.PADDING_LTRB,
                children: snapshot.data.map((object) {
                  return SCard(categoryObject: object);
                }).toList());
          } else {
            return Text(
              'Loading...',
              style: TextStyle(color: Colors.white, fontSize: 13),
            );
          }
        },
      ),
    );
  }
}
