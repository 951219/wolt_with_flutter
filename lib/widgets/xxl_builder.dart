import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/restaurantcards/xxl_card.dart';
import 'package:wolt_with_flutter/services/restaurant_service.dart';

class XXLBuilder {
  List<Widget> getList() {
    return RestaurantService().getRestaurants().map((object) {
      return XXLCard(restoObject: object);
    }).toList();
  }
}
