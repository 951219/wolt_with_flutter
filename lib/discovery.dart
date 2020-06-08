import 'package:wolt_with_flutter/discoveryWidgets/herobanner.dart';
import 'package:wolt_with_flutter/discoveryWidgets/secondrow.dart';
import 'package:flutter/material.dart';

class Discovery extends StatelessWidget {
  const Discovery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 55),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Row(children: [
              Text('Discover ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 38,
                      fontWeight: FontWeight.bold)),
              Text(
                'Tallinn',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          HeroBanner(),
          Padding(
            padding: EdgeInsets.fromLTRB(19, 0, 19, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Only on Wolt',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                FlatButton(
                  color: Colors.blue[50],
                  textColor: Colors.blue,
                  onPressed: () => {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Features(),
          Container(
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                    'Quick links',
                    style: TextStyle(
                        // color: Colors.b,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Text('Redeem Code'),
                ),
                ListTile(
                  leading: Text('Redeem Code 2'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
