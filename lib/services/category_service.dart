import 'package:wolt_with_flutter/datamodels/category_object.dart';

class CategoryService {
  List<CategoryObject> _listOfCategories = [
    CategoryObject(
        title: 'Sushi',
        imgUrl: 'https://nami-nami.ee/files/news/3755/sushiavapilt.jpg'),
    CategoryObject(
        title: 'Healthy',
        imgUrl:
            'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg?w=1155&h=1528'),
    CategoryObject(
        title: 'Burger',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT-Qg9JBHNHkwua_2S4DyP2XvwppMiJSvOLpg&usqp=CAU'),
    CategoryObject(
        title: 'Pizza',
        imgUrl:
            'https://cdn2.chilli.ee/upload/16c29f0e94bb52db6d04142d3c1bc03c_1586806276.jpg'),
    CategoryObject(
        title: 'Grocery',
        imgUrl:
            'https://specials-images.forbesimg.com/imageserve/1141999659/960x0.jpg?fit=scale'),
    CategoryObject(
        title: 'Vegan',
        imgUrl:
            'https://www.nomeatathlete.com/wp-content/uploads/2013/08/10-Things-I-Wish-I-Knew-Before-I-Went-Vegan-Resized.png'),
    CategoryObject(
        title: 'Pasta',
        imgUrl:
            'https://www.budgetbytes.com/wp-content/uploads/2013/07/Creamy-Spinach-Tomato-Pasta-bowl-500x375.jpg'),
    CategoryObject(
        title: 'Wings',
        imgUrl:
            'https://www.macheesmo.com/wp-content/uploads/2015/03/Sticky-Chicken-Wings-hero.jpg'),
    CategoryObject(
        title: 'Dessert',
        imgUrl:
            'https://img.taste.com.au/gq02jKp2/taste/2018/11/dessert-platter-144036-1.jpg'),
    CategoryObject(
        title: 'Noodles',
        imgUrl:
            'https://www.loveandoliveoil.com/wp-content/uploads/2015/03/soy-sauce-noodlesH2.jpg'),
    CategoryObject(
        title: 'Vegetarian',
        imgUrl:
            'https://www.heartfoundation.org.nz/media/images/nutrition/page-heros/plant-based-diet_737_553_c1.jpg'),
    CategoryObject(
        title: 'Breakfast',
        imgUrl:
            'https://simply-delicious-food.com/wp-content/uploads/2018/10/breakfast-board-500x500.jpg'),
    CategoryObject(
        title: 'Smoothie',
        imgUrl:
            'https://www.dinneratthezoo.com/wp-content/uploads/2017/01/mixed-berry-smoothie-2.jpg'),
    CategoryObject(
        title: 'Kebab',
        imgUrl:
            'https://prod-wolt-venue-images-cdn.wolt.com/5ca1f066b6952b000c2ae56c/c550fd4fbf3b7bf46e84a89e7c554371'),
    CategoryObject(
        title: 'Sandwich',
        imgUrl:
            'https://realfood.tesco.com/media/images/RFO-1400x919-ChickenClubSandwich-0ee77c05-5a77-49ac-a3bd-4d45e3b4dca7-0-1400x919.jpg'),
    CategoryObject(
        title: 'Street food',
        imgUrl:
            'https://lh3.googleusercontent.com/proxy/6gvv108Crgft3uQREIheFBunEIQ5tYw6ZjYN3i515qq-Z-Er6_Jttnxb1K1C-YcUokNr3S_ctTk41dH5j32IMqo2fSluCUSMmCa__7AfDtDLk0SGTOsfOJ-7HnWxvavdPDzmeDLx9FPNTFg'),
    CategoryObject(
        title: 'Soup',
        imgUrl:
            'https://asset.slimmingworld.co.uk/content/media/11560/chicken-vegetable-soup-iceland_sw_recipe.jpg?v1=JGXiore20qg9NNIj0tmc3TKfKw-jr0s127JqqpCA2x7sMviNgcAYh1epuS_Lqxebn9V_qusKHfwbF7MOUrAPptzBhXIUL1Xnq2Mmdvx4fOk&width=640&height=640'),
    CategoryObject(
        title: 'Steak',
        imgUrl:
            'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fcdn-image.myrecipes.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F4_3_horizontal_-_1200x900%2Fpublic%2F1551799424%2Fmr%20reshoot%20sirloin.jpg%3Fitok%3DL7pjUQhI'),
    CategoryObject(
        title: 'Fish',
        imgUrl:
            'https://images.summitmedia-digital.com/yummyph/images/2017/12/18/baked-whole-fish.jpg'),
    CategoryObject(
        title: 'Alcohol',
        imgUrl:
            'https://images.ctfassets.net/ip74mqmfgvqf/4TBnKGAY1i4guUwyQewusy/e1b86c06f513cfec9162929030dcb410/FRANK_drug_image_alcohol.jpg')
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

  List<CategoryObject> getCategories() {
    _listOfCategories.shuffle();
    return _listOfCategories;
  }
}
