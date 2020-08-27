import 'dart:convert';
import 'package:wolt_with_flutter/datamodels/dish_object.dart';
import 'package:http/http.dart' as http;

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

  //TODO fetch multiple random dishes for a Restaurants page menu
}
