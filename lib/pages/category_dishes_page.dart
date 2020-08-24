import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/category_object.dart';
import 'package:wolt_with_flutter/widgets/dishes_builder.dart';
import '../constants.dart' as constants;

// TODO category dishes page
class CategoryDishesPage extends StatelessWidget {
  CategoryDishesPage(this.categoryObject);

  final CategoryObject categoryObject;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            categoryObject.title,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: DishesBuilder(categoryObject),
        ),
      ),
    );
  }
}
