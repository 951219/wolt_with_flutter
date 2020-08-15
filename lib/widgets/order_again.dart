import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/restaurantcards/smallest_restaurant_card.dart';
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
                return SmallestRestaurantCard(restoObject: object);
              }).toList())),
    );
  }
}
