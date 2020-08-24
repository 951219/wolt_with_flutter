import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/category_object.dart';
import 'package:wolt_with_flutter/restaurantcards/s_card.dart';
import 'package:wolt_with_flutter/services/category_service.dart';
import '../constants.dart' as Constants;
import 'dart:math' as math;

class SBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        child: FutureBuilder(
            future: CategoryService().fetchCategoryObjects(),
            builder: (BuildContext context,
                AsyncSnapshot<List<CategoryObject>> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                    scrollDirection: Axis.horizontal,
                    padding: Constants.PADDING_LTRB,
                    children: snapshot.data.map((object) {
                      object.numberOfVenues = math.Random().nextInt(15) + 2;
                      return SCard(categoryObject: object); //Feature(photo);
                    }).toList());
              } else {
                return Text('Loading...',
                    style: TextStyle(color: Colors.white, fontSize: 13));
              }
            }));
  }
}
