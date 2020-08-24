import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/category_object.dart';
import 'package:wolt_with_flutter/datamodels/dish_object.dart';
import 'package:wolt_with_flutter/restaurantcards/dish_card.dart';

import 'package:wolt_with_flutter/services/category_service.dart';

import '../constants.dart' as constants;

class DishesBuilder extends StatelessWidget {
  final CategoryObject categoryObject;

  DishesBuilder(this.categoryObject);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CategoryService().fetchDishesByCategory(categoryObject),
        builder:
            (BuildContext context, AsyncSnapshot<List<DishObject>> snapshot) {
          if (snapshot.hasData) {
            return ListView(children: [
              SizedBox(
                height: 10,
              ),
              Wrap(
                  children: snapshot.data.map((object) {
                return DishCard(dishObject: object); //Feature(photo);
              }).toList())
            ]);
          } else {
            return Center(
                child: SizedBox(
                    height: 75, width: 75, child: CircularProgressIndicator()));
          }
        });
  }
}
