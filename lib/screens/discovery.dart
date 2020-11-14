import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/user_location.dart';
import 'package:wolt_with_flutter/widgets/s_builder.dart';
import 'package:wolt_with_flutter/widgets/m_builder.dart';
import 'package:wolt_with_flutter/widgets/xl_builder.dart';
import 'package:wolt_with_flutter/widgets/l_builder.dart';

import '../constants.dart' as constants;

class Discovery extends StatelessWidget {
  const Discovery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 120,
          floating: false,
          pinned: true,
          elevation: 2,
          flexibleSpace: FlexibleSpaceBar(
              titlePadding: constants.PADDING_LTRB,
              title: FutureBuilder(
                future: constants.userLocation,
                builder: (BuildContext context,
                    AsyncSnapshot<UserLocation> snapshot) {
                  if (snapshot.hasData) {
                    return Row(children: [
                      Text('Discover ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold)),
                      Text(
                        snapshot.data.city,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ]);
                  } else {
                    return Text('Discover ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold));
                  }
                },
              )),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    XLBuilder(),
                    Padding(
                      padding: constants.PADDING_LTRB,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Only on Wolt!',
                            style: constants.TITLE_STYLE,
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
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
                    MBuider(),
                    Padding(
                      padding: constants.PADDING_LTRB,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Wolt Specials!',
                            style: constants.TITLE_STYLE,
                          ),
                        ],
                      ),
                    ),
                    LBuilder(),
                    Padding(
                      padding: constants.PADDING_LTRB,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Categories',
                            style: constants.TITLE_STYLE,
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
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
                    SBuilder(),
                    Container(
                      padding: constants.PADDING_FOR_QUICKLINKS,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text(
                              'Quick links',
                              style: constants.TITLE_STYLE,
                            ),
                          ),
                          ListTile(
                            leading: Text(
                              'Redeem Code',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.navigate_next),
                            onTap: () => {},
                            dense: true,
                          ),
                          Divider(
                            indent: 15,
                            height: 1,
                            color: Colors.grey[350],
                          ),
                          ListTile(
                            leading: Text(
                              'Customer Support',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.navigate_next),
                            onTap: () => {},
                            dense: true,
                          ),
                          Divider(
                            indent: 15,
                            height: 1,
                            color: Colors.grey[350],
                          ),
                          ListTile(
                            leading: Text(
                              'Send a gift',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.navigate_next),
                            onTap: () => {},
                            dense: true,
                          ),
                          Divider(
                            indent: 15,
                            height: 1,
                            color: Colors.grey[350],
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
