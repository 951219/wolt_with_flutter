import 'package:flutter/material.dart';

class SpecialsBanner extends StatelessWidget {
  List<_SpecialsBannerItem> _bannerItems() {
    return [
      _SpecialsBannerItem(
          imageURL:
              'https://previews.123rf.com/images/denisenkomax/denisenkomax1511/denisenkomax151100046/48743641-delicious-fresh-salami-pizza-served-on-wooden-table-ideal-for-advertisment.jpg',
          title: 'Loud bird',
          subtitle: 'sometimes the bird is loud',
          discounted: true,
          price: 10.0,
          newPrice: 7.8),
      _SpecialsBannerItem(
          imageURL:
              'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_960_720.jpg',
          title: 'Beatufil Cat',
          subtitle: 'meow meow',
          discounted: false,
          price: 10.0,
          newPrice: 7.8),
      _SpecialsBannerItem(
          imageURL:
              'https://cdn.pixabay.com/photo/2016/12/04/21/58/rabbit-1882699_960_720.jpg',
          title: 'Rabit',
          subtitle: 'She is cute',
          discounted: true,
          price: 12,
          newPrice: 5),
      _SpecialsBannerItem(
          imageURL:
              'https://prod-wolt-venue-images-cdn.wolt.com/5c63f0857c0f51000b31e96b/e6d031d2ebfdcc85d3a9fc7497b90316',
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
        height: 170,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20.0),
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

// class _itemText extends StatelessWidget {
//   const _FeatureText(this.text, this.fontSize);
//   final String text;
//   final double fontSize;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 14),
//       child: Text(text,
//           style:
//               TextStyle(fontFamily: 'ConcertOne-Regular', fontSize: fontSize)),
//     );
//   }
// }

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
                Image.network(featurePhoto.imageURL,
                    width: 240, height: 145, fit: BoxFit.cover),
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
            // margin: EdgeInsets.all(10),
          ),
        ]);
  }
}
