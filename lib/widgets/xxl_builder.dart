import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/restaurantcards/xxl_card.dart';
import 'package:wolt_with_flutter/services/restaurant_service.dart';
import '../constants.dart' as constants;

class XXLBuilder extends StatelessWidget {
  //!  DO NOT USE BUILD METHOD
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        padding: constants.PADDING_LTRB,
        children: RestaurantService().getRestaurants().map((object) {
          return XXLCard(restoObject: object);
        }).toList());
  }

  List<Widget> getList() {
    return RestaurantService().getRestaurants().map((object) {
      return XXLCard(restoObject: object);
    }).toList();
  }
}
