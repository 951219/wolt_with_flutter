import 'package:flutter/material.dart';

import '../constants.dart' as Constants;

class OrderAgain extends StatelessWidget {
  List<_HistoryResto> _feature() {
    return [
      _HistoryResto(
          imageURL:
              'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_960_720.jpg',
          title: 'Beatufil Cat',
          subtitle: 'I love cat',
          featureString: 'Feature1'),
      _HistoryResto(
          imageURL:
              'https://cdn.pixabay.com/photo/2011/09/27/18/52/sparrow-9950_960_720.jpg',
          title: 'Loud bird',
          subtitle: 'Small birdie',
          featureString: 'Feature2'),
      _HistoryResto(
          imageURL:
              'https://cdn.pixabay.com/photo/2016/12/04/21/58/rabbit-1882699_960_720.jpg',
          title: 'Rabit',
          subtitle: 'She is cute',
          featureString: 'Feature3')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 240,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _feature().map((photo) {
              return _HistoryGridItem(featurePhoto: photo); //Feature(photo);
            }).toList()));
  }
}

class _HistoryGridItem extends StatelessWidget {
  _HistoryGridItem({Key key, @required this.featurePhoto}) : super(key: key);

  final _HistoryResto featurePhoto;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(featurePhoto.imageURL)),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  featurePhoto.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(featurePhoto.subtitle),
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
          )
        ],
      ),
      // elevation: 2,
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}

class _HistoryResto {
  _HistoryResto({this.imageURL, this.title, this.subtitle, this.featureString});
  final String imageURL;
  final String title;
  final String subtitle;
  final String featureString;
}
