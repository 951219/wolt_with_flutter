import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';

class RestaurantService {
  List<RestaurantObject> _restoList = [
    RestaurantObject(
        title: 'Test Restaurant',
        subtitle: 'We have great food',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_1280.jpg',
        baseDeliveryPrice: 1.9,
        rating: 8.8,
        pricing: '€€',
        baseEstimate: 40,
        isFavorite: true,
        isNew: false),
    RestaurantObject(
        title: 'Pizza plaza',
        subtitle: 'Best pizza in town',
        imageURL:
            'https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_1280.jpg',
        baseDeliveryPrice: 1.9,
        rating: 9.5,
        pricing: '€',
        baseEstimate: 20,
        isFavorite: false,
        isNew: true),
    RestaurantObject(
        title: 'Cafe',
        subtitle: '',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908_1280.jpg',
        baseDeliveryPrice: 1.9,
        rating: 8.4,
        pricing: '€€€',
        baseEstimate: 45,
        isFavorite: true,
        isNew: false),
    RestaurantObject(
        title: 'Pizza',
        subtitle: 'nom nom',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/03/23/19/57/asparagus-2169305_1280.jpg',
        baseDeliveryPrice: 1.9,
        rating: 9.2,
        pricing: '€€',
        baseEstimate: 30,
        isFavorite: true,
        isNew: true),
    RestaurantObject(
        title: 'Burger king',
        subtitle: 'nom nom',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/03/23/19/57/asparagus-2169305_1280.jpg',
        baseDeliveryPrice: 1.9,
        rating: 9.2,
        pricing: '€€',
        baseEstimate: 30,
        isFavorite: true,
        isNew: false),
    RestaurantObject(
        title: 'Sushiplaza',
        subtitle: 'oof',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/03/23/19/57/asparagus-2169305_1280.jpg',
        baseDeliveryPrice: 1.9,
        rating: 9.2,
        pricing: '€€',
        baseEstimate: 30,
        isFavorite: true,
        isNew: false),
    RestaurantObject(
        title: 'Cafe Boy',
        subtitle: 'yay',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908_1280.jpg',
        baseDeliveryPrice: 1.9,
        rating: 7.9,
        pricing: '€',
        baseEstimate: 45,
        isFavorite: false,
        isNew: true),
  ];

// brekkie https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_1280.jpg
// coffe https://cdn.pixabay.com/photo/2014/06/16/23/10/spice-370114_1280.jpg
// pizza https://cdn.pixabay.com/photo/2017/12/10/14/47/piza-3010062_1280.jpg
// waffles https://cdn.pixabay.com/photo/2017/03/31/10/56/waffles-2190961_1280.jpg
// burger https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_1280.jpg
// cake https://cdn.pixabay.com/photo/2017/01/11/11/33/cake-1971552_1280.jpg
// https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994_1280.jpg
// https://cdn.pixabay.com/photo/2017/01/26/02/06/platter-2009590_1280.jpg
// pizza https://previews.123rf.com/images/denisenkomax/denisenkomax1511/denisenkomax151100046/48743641-delicious-fresh-salami-pizza-served-on-wooden-table-ideal-for-advertisment.jpg

  List<RestaurantObject> getRestaurants() {
    return _restoList;
  }

  List<RestaurantObject> getNumberOfRestaurants(int number) {
    return _restoList.sublist(0, number);
  }

  List<String> getRestaurantNames() {
    return _restoList.map((e) => e.title.toLowerCase()).toList();
  }
}
