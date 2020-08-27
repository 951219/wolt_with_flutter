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
    for (int i = 0; i < math.Random().nextInt(categories.length); i++) {
      List<DishObject> fetchedDishes =
          await CategoryService().fetchDishesByCategory(categories[i]);
      //TODO add another forloop for pulling hte contents for each meal
      dishes.addAll(fetchedDishes);
    }
    dishes.forEach((element) {
      // !  contents array is empty
      print(
          '{title: ${element.title} contents: ${element.contents} imgURL: ${element.imgURL}}');
      print(element.contents.length);
    });
    dishes.shuffle();
    return dishes;
  }
}
