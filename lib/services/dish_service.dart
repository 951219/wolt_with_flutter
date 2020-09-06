import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'package:wolt_with_flutter/datamodels/category_object.dart';
import 'package:wolt_with_flutter/datamodels/dish_object.dart';
import 'package:http/http.dart' as http;
import 'package:wolt_with_flutter/services/category_service.dart';
import '../constants.dart' as constants;

class DishService {
  Future<DishObject> fetchARandomDish() async {
    List<DishObject> _listOfDishes = [];
    final response =
        await http.get('https://www.themealdb.com/api/json/v1/1/random.php');

    if (response.statusCode == 200) {
      Map<String, dynamic> d = jsonDecode(response.body);
      //TODO needs refactoring
      _listOfDishes = List<DishObject>.from(
        d['meals'].map(
          (x) => DishObject.fromJson(x),
        ),
      );

      print('Success - fetchARandomDish() - ${_listOfDishes[0].title}');
      return _listOfDishes[0];
    } else {
      throw Exception('Failure - fetchARandomDish()');
    }
  }

  Future<List<DishObject>> pullRandomMenu() async {
    List<DishObject> dishes = [];
    List<CategoryObject> categories = await constants.categories;

    int numberOfCategories = math.Random().nextInt(categories.length);

    for (int i = 0; i < numberOfCategories; i++) {
      List<DishObject> fetchedDishes =
          await CategoryService().fetchDishesByCategory(categories[i]);

      // for (DishObject obj in fetchedDishes) {
      //   final response = await http.get(
      //       'https://www.themealdb.com/api/json/v1/1/search.php?s=${obj.title}');

      //   if (response.statusCode == 200) {
      //     Map<String, dynamic> d = jsonDecode(response.body);
      //     List<DishObject> _listOfDishes = List<DishObject>.from(
      //       d['meals'].map(
      //         (x) => DishObject.fromJson(x),
      //       ),
      //     );

      //     print('Success - fetchARandomDish() - ${_listOfDishes[0].title}');
      //     obj = _listOfDishes[0];
      //   } else {
      //     throw Exception(
      //         'Failure - Pulling a dish contents in dish_service.dart');
      //   }
      // }

      // TODO add another forloop for pulling hte contents for each meal
      dishes.addAll(fetchedDishes);

      if (dishes.length > 15) {
        dishes = dishes.sublist(0, 15);
        break;
      }
    }

    String dishesForPrint = '';
    for (DishObject object in dishes) {
      dishesForPrint += '${object.title}, ';
    }
    dishes.shuffle();
    print(
        'Success - pullRandomMenu() - fetched: ${dishes.length} dishes: $dishesForPrint \n');
    return dishes;
  }
}
