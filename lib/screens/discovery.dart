import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/widgets/exclusivity_banner.dart';
import 'package:wolt_with_flutter/widgets/hero_banner.dart';
import 'package:wolt_with_flutter/widgets/specials_banner.dart';

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
            elevation: 02,
            // TODO remove the shadow below "Discover Tallinn"
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
          SliverList(
            delegate: SliverChildListDelegate([
              HeroBanner(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Only on Wolt!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              // ),
              Features(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: Text(
                  'Wolt Specials!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SpecialsBanner(),
              Container(
                padding: EdgeInsets.only(left: 10),
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
                      trailing: Icon(Icons.navigate_next),
                      onTap: () => {},
                      dense: true,
                    ),
                    Divider(
                      indent: 12,
                      height: 1,
                      color: Colors.grey[350],
                    ),
                    ListTile(
                      leading: Text('Customer Support'),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () => {},
                      dense: true,
                    ),
                    Divider(
                      indent: 12,
                      height: 1,
                      color: Colors.grey[350],
                    ),
                    ListTile(
                      leading: Text('Send a gift'),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () => {},
                      dense: true,
                    ),
                    Divider(
                      indent: 12,
                      height: 1,
                      color: Colors.grey[350],
                    ),
                    Divider(
                      height: 100,
                      color: Colors.white,
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
