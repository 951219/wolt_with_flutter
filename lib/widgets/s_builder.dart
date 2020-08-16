import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/restaurantcards/s_card.dart';
import 'package:wolt_with_flutter/services/category_service.dart';
import '../constants.dart' as Constants;
import 'dart:math' as math;

//TODO categories data model and service

class SBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: Constants.PADDING_LTRB,
            children: CategoryService().getCategories().map((object) {
              object.numberOfVenues = math.Random().nextInt(15) + 1;
              return SCard(categoryObject: object); //Feature(photo);
            }).toList()));
  }
}
