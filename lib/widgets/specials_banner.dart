import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

//TODO create a datamodel and a service for specials

class SpecialsBanner extends StatelessWidget {
  List<_SpecialsBannerItem> _bannerItems() {
    return [
      _SpecialsBannerItem(
          imageURL:
              'https://previews.123rf.com/images/denisenkomax/denisenkomax1511/denisenkomax151100046/48743641-delicious-fresh-salami-pizza-served-on-wooden-table-ideal-for-advertisment.jpg',
          title: 'Salami pizza',
          subtitle: 'Delicious and fresh salami',
          discounted: true,
          price: 10.0,
          newPrice: 7.8),
      _SpecialsBannerItem(
          imageURL:
              'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_1280.jpg',
          title: 'Delicious burger',
          subtitle: 'yummy',
          discounted: false,
          price: 10.0,
          newPrice: 7.8),
      _SpecialsBannerItem(
          imageURL:
              'https://cdn.pixabay.com/photo/2017/03/31/10/56/waffles-2190961_1280.jpg',
          title: 'Waffles',
          subtitle: 'Perfect for breakfast',
          discounted: true,
          price: 12,
          newPrice: 5),
      _SpecialsBannerItem(
          imageURL:
              'https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_1280.jpg',
          title: 'Pizza',
          subtitle: 'nom nom',
          discounted: false,
          price: 10.0,
          newPrice: 7.8)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 175,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: Constants.PADDING_LTRB,
            children: _bannerItems().map((photo) {
              return _SpecialsGridItem(featurePhoto: photo); //Feature(photo);
            }).toList()));
  }
}

class _SpecialsBannerItem {
  _SpecialsBannerItem(
      {this.imageURL,
      this.title,
      this.subtitle,
      this.discounted,
      this.price,
      this.newPrice});
  final String imageURL;
  final String title;
  final String subtitle;
  final bool discounted;
  final double price;
  final double newPrice;
}

class _SpecialsGridItem extends StatelessWidget {
  _SpecialsGridItem({Key key, @required this.featurePhoto}) : super(key: key);

  final _SpecialsBannerItem featurePhoto;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 240,
                  height: 145,
                  child: Image.network(
                    featurePhoto.imageURL,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          featurePhoto.title,
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                              )
                            ],
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          featurePhoto.subtitle,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                )
                              ],
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
                //TODO add red container for new price
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 2,
          ),
        ]);
  }
}
