import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/restaurantcards/xxl_card.dart';
import 'package:wolt_with_flutter/services/restaurant_service.dart';
import '../constants.dart' as constants;

class XXLBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
            scrollDirection: Axis.vertical,
            padding: constants.PADDING_LTRB,
            children: RestaurantService().getRestaurants().map((object) {
              return XXLCard(restoObject: object); //Feature(photo);
            }).toList()));
  }
}
