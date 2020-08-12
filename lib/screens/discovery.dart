import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/widgets/exclusivity_banner.dart';
import 'package:wolt_with_flutter/widgets/hero_banner.dart';
import 'package:wolt_with_flutter/widgets/specials_banner.dart';

import '../constants.dart' as Constants;

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
            elevation: 2,
            // TODO remove the shadow below "Discover Tallinn"
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: Constants.PADDING_LTRB,
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
          SliverList(
            delegate: SliverChildListDelegate([
              HeroBanner(),
              Padding(
                padding: Constants.PADDING_LTRB,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Only on Wolt!',
                      style: Constants.TITLE_STYLE,
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
              ExclusivityBanner(),
              Padding(
                padding: Constants.PADDING_LTRB,
                child: Text(
                  'Wolt Specials!',
                  style: Constants.TITLE_STYLE,
                ),
              ),
              SpecialsBanner(),
              Container(
                padding: Constants.PADDING_FOR_QUICKLINKS,
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        'Quick links',
                        style: Constants.TITLE_STYLE,
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
            ]),
          ),
        ],
      ),
    );
  }
}
