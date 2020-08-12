import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

class ExclusivityBanner extends StatelessWidget {
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
          subtitle: 'Small birdie',
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
      _FeaturePhoto(
          imageURL:
              'https://cdn.pixabay.com/photo/2011/09/27/18/52/sparrow-9950_960_720.jpg',
          title: 'Loud bird',
          subtitle: 'new bird',
          featureString: 'Feature2'),
      _FeaturePhoto(
          imageURL:
              'https://cdn.pixabay.com/photo/2016/12/04/21/58/rabbit-1882699_960_720.jpg',
          title: 'Rabit',
          subtitle: 'She is cute',
          featureString: 'Feature3'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 210,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: Constants.PADDING_LTRB,
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
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          Container(
            child: Image.network(featurePhoto.imageURL,
                width: 160, height: 110, fit: BoxFit.cover),
          ),
          Container(
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  featurePhoto.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(featurePhoto.subtitle),
                Container(
                  // margin: EdgeInsets.all(10),
                  child: Divider(
                    //TODO add a visible divider
                    // indent: 12,
                    height: 1,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text('\$'),
                    Text(' * '),
                    Text('45 min'),
                    Text(' * '),
                    Text(' :D '),
                    Text('9.0'),
                  ],
                )
              ],
            ),
            // TODO fix text positioning in the exclusivity banner/profile favorites
          )
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 2,
      // margin: EdgeInsets.all(10),
    );
  }
}
