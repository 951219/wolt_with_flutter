import 'package:wolt_with_flutter/datamodels/special_object.dart';

class SpecialsService {
  List<SpecialObject> specialsList = [
    SpecialObject(
        imageURL:
            'https://previews.123rf.com/images/denisenkomax/denisenkomax1511/denisenkomax151100046/48743641-delicious-fresh-salami-pizza-served-on-wooden-table-ideal-for-advertisment.jpg',
        title: 'Salami pizza',
        subtitle: 'Delicious and fresh salami',
        discounted: true,
        price: 10.0,
        newPrice: 7.8),
    SpecialObject(
        imageURL:
            'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_1280.jpg',
        title: 'Delicious burger',
        subtitle: 'yummy',
        discounted: false,
        price: 10.0,
        newPrice: 7.8),
    SpecialObject(
        imageURL:
            'https://cdn.pixabay.com/photo/2017/03/31/10/56/waffles-2190961_1280.jpg',
        title: 'Waffles',
        subtitle: 'Perfect for breakfast',
        discounted: true,
        price: 12,
        newPrice: 5),
    SpecialObject(
        imageURL:
            'https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_1280.jpg',
        title: 'Pizza',
        subtitle: 'nom nom',
        discounted: false,
        price: 10.0,
        newPrice: 7.8)
  ];

  List<SpecialObject> getSpecials() {
    return specialsList;
  }
}
