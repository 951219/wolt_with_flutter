import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';

// TODO restaurant page
class RestaurantPage extends StatelessWidget {
  RestaurantPage(this.restaurantObject);

  final RestaurantObject restaurantObject;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(restaurantObject.title),
      ),
    );
  }
}
