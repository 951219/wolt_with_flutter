import 'dart:convert';
import 'dart:math' as math;
import 'package:wolt_with_flutter/datamodels/category_object.dart';
import 'package:wolt_with_flutter/datamodels/dish_object.dart';
import 'package:http/http.dart' as http;
import 'package:wolt_with_flutter/services/category_service.dart';

class DishService {
  Future<DishObject> fetchARandomDish() async {
    print('Fetching a random dish');
    List<DishObject> _listOfDishes = [];
    final response =
        await http.get('https://www.themealdb.com/api/json/v1/1/random.php');

    if (response.statusCode == 200) {
      print('Success - we got pulled a random dish');

      Map<String, dynamic> d = jsonDecode(response.body);
      //TODO needs refactoring
      _listOfDishes = List<DishObject>.from(
        d['meals'].map(
          (x) => DishObject.fromJson(x),
        ),
      );

      print(_listOfDishes[0].title);
      return _listOfDishes[0];
    } else {
      throw Exception('Failed to load a random dish');
    }
  }

  Future<List<DishObject>> pullRandomMenu() async {
    List<DishObject> dishes = [];
    List<CategoryObject> categories =
        await CategoryService().fetchCategoryObjects();

    int numberOfCategories = math.Random().nextInt(categories.length);

    for (int i = 0; i < numberOfCategories; i++) {
      List<DishObject> fetchedDishes =
          await CategoryService().fetchDishesByCategory(categories[i]);
      // for(DishObject obj in fetchedDishes){
      // TODO add another forloop for pulling hte contents for each meal
      // }

      dishes.addAll(fetchedDishes);

      if (dishes.length > 15) {
        dishes = dishes.sublist(0, 15);
        break;
      }
    }

    print('found: ${dishes.length} dishes');
    for (DishObject object in dishes) {
      print(object.title);
    }

    dishes.shuffle();
    return dishes;
  }
}
