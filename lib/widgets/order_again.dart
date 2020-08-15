import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/restaurantcards/smallest_restaurant_card.dart';
import 'package:wolt_with_flutter/services/restaurant_service.dart';

import '../constants.dart' as constants;

class HistoryOrders extends StatelessWidget {
  HistoryOrders(
      {this.howMany,
      this.showDeliveryPrice = false,
      this.addBottomLine = false});
  final int howMany;
  final bool showDeliveryPrice;
  final bool addBottomLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: constants.PADDING_LTRB,
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
            RestaurantService().getNumberOfRestaurants(howMany).map((object) {
          return Column(
            children: [
              SmallestRestaurantCard(
                  restoObject: object, showDeliveryPrice: showDeliveryPrice),
              addBottomLine
                  ? Divider(
                      endIndent: 20,
                      indent: 90,
                      height: 1,
                      thickness: 1,
                    )
                  : Container()
            ],
          );
        }).toList(),
      )),
    );
  }
}
