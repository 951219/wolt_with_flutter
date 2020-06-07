import 'package:flutter/material.dart';

class Features extends StatelessWidget {
  List<_FeaturePhoto> _feature() {
    return [
      _FeaturePhoto(
          imageURL:
              'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_960_720.jpg',
          title: 'Beatufil Cat',
          subtitle: 'I love cat',
          featureString: 'Feature1'),
      _FeaturePhoto(
          imageURL:
              'https://cdn.pixabay.com/photo/2011/09/27/18/52/sparrow-9950_960_720.jpg',
          title: 'Loud bird',
          subtitle: 'sometimes the bird is loud',
          featureString: 'Feature2'),
      _FeaturePhoto(
          imageURL:
              'https://cdn.pixabay.com/photo/2016/12/04/21/58/rabbit-1882699_960_720.jpg',
          title: 'Rabit',
          subtitle: 'She is cute',
          featureString: 'Feature3'),
      _FeaturePhoto(
          imageURL:
              'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_960_720.jpg',
          title: 'Beatufil Cat',
          subtitle: 'I love cat',
          featureString: 'Feature1'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        width: 120,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10.0),
            children: _feature().map<Widget>((photo) {
              return _FeatureGridItem(featurePhoto: photo); //Feature(photo);
            }).toList()));
  }
}

class _FeaturePhoto {
  _FeaturePhoto({this.imageURL, this.title, this.subtitle, this.featureString});
  final String imageURL;
  final String title;
  final String subtitle;
  final String featureString;
}

class _FeatureGridItem extends StatelessWidget {
  _FeatureGridItem({Key key, @required this.featurePhoto}) : super(key: key);

  final _FeaturePhoto featurePhoto;
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
                    width: 120, height: 120, fit: BoxFit.cover),
                Positioned(
                    top: 16,
                    left: 140,
                    child: Container(
                      height: 25,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.black, //Color(0xff0F0F0F),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                            )
                          ]),
                      child: Center(
                        child: Text(
                          featurePhoto.featureString,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
