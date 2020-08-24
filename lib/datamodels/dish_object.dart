class DishObject {
  String title;
  String imgUrl;

  DishObject({this.title, this.imgUrl});

  factory DishObject.fromJson(Map<String, dynamic> json) {
    return DishObject(
      title: json['strMeal'],
      imgUrl: json['strMealThumb'],
    );
  }
}
