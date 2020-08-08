import 'package:flutter/material.dart';

//TODO convert to carousel so it would have a page indicator in the bottom and it would snap into place ,allowing scrolling one by one

class HeroBanner extends StatelessWidget {
  List<_HeroBannerItem> _bannerItems() {
    return [
      _HeroBannerItem(
          imageURL:
              'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_960_720.jpg',
          title: 'Beatufil Cat',
          subtitle: 'meow meow'),
      _HeroBannerItem(
          imageURL:
              'https://cdn.pixabay.com/photo/2011/09/27/18/52/sparrow-9950_960_720.jpg',
          title: 'Loud bird',
          subtitle: 'sometimes the bird is loud'),
      _HeroBannerItem(
          imageURL:
              'https://cdn.pixabay.com/photo/2016/12/04/21/58/rabbit-1882699_960_720.jpg',
          title: 'Rabit',
          subtitle: 'She is cute'),
      _HeroBannerItem(
          imageURL:
              'https://prod-wolt-venue-images-cdn.wolt.com/5c63f0857c0f51000b31e96b/e6d031d2ebfdcc85d3a9fc7497b90316',
          title: 'Pizza',
          subtitle: 'nom nom')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 285,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10),
            children: _bannerItems().map((photo) {
              return _HeroGridItem(featurePhoto: photo); //Feature(photo);
            }).toList()));
  }
}

class _HeroBannerItem {
  _HeroBannerItem({this.imageURL, this.title, this.subtitle});
  final String imageURL;
  final String title;
  final String subtitle;
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

class _HeroGridItem extends StatelessWidget {
  _HeroGridItem({Key key, @required this.featurePhoto}) : super(key: key);

  final _HeroBannerItem featurePhoto;
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
                    width: 415, height: 245, fit: BoxFit.cover),
                Positioned(
                    bottom: 16,
                    left: 16,
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
                            fontSize: 25,
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
        ]);
  }
}
