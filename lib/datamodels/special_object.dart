import 'restaurant_object.dart';

class SpecialObject {
  RestaurantObject restaurant;
  String dishName;
  String specialDishImage;
  double oldPrice;
  double newPrice;

  SpecialObject(
      {this.restaurant,
      this.dishName,
      this.specialDishImage,
      this.oldPrice,
      this.newPrice});
}
