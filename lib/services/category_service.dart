import 'dart:convert';
import 'package:wolt_with_flutter/datamodels/category_object.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  List<CategoryObject> _listOfCategories = [];

  Future<List<CategoryObject>> fetchCategoryObjects() async {
    final response = await http
        .get('https://www.themealdb.com/api/json/v1/1/categories.php');

    if (response.statusCode == 200) {
      print('Success');

      Map<String, dynamic> d = jsonDecode(response.body);
      _listOfCategories = List<CategoryObject>.from(
          d['categories'].map((x) => CategoryObject.fromJson(x)));

      _listOfCategories.shuffle();
      return _listOfCategories;
    } else {
      throw Exception('Failed to load categories');
    }
  }

// TODO pullDishesByCategory();
}
