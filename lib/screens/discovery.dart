import 'package:wolt_with_flutter/Widgets/herobanner.dart';
import 'package:wolt_with_flutter/Widgets/secondrow.dart';
import 'package:flutter/material.dart';

class Discovery extends StatelessWidget {
  const Discovery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 120,
            floating: false,
            pinned: true,
            elevation: 1,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.fromLTRB(20, 0, 0, 15),
              title: Row(children: [
                Text('Discover ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold)),
                Text(
                  'Tallinn',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                HeroBanner(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Only on Wolt',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                // ),
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
          ),
        ],
      ),
    );
  }
}
// Scaffold(
//   appBar: AppBar(
//     backgroundColor: Colors.white,
//     title: Container(
//       child: Row(children: [
//TODO decreasing appbar, can use SliverAppBar widget
//         Text(
//           'Discover ',
//           style: TextStyle(color: Colors.black),
//         ),
//         Text(
//           'Tallinn',
//           style: TextStyle(color: Colors.blue),
//         ),
//       ]),
//     ),
//   ),
// body:
// )
