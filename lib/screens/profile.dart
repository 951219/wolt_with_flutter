import 'package:flutter/material.dart';
import '../widgets/profile_favorites.dart';
import '../widgets/order_again.dart';

import '../constants.dart' as Constants;
//TODO top bar, "Howdy, Kenert" to "Profile" through adding a Sliver maybe?

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text('Profile', style: Constants.TITLE_STYLE),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 20,
                child: IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          expandedHeight: 120,
          floating: false,
          pinned: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: Constants.PADDING_LTRB,
            title: Row(children: [
              Text(
                'Howdy Kenert!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            // SizedBox(height: 15),
            // Padding(
            //   padding: Constants.PADDING_LTRB,
            //   child: Text(
            //     'Howdy Kenert!',
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 30,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: Constants.PADDING_LTRB,
                    child: Text(
                      'Kenert Karu',
                      style: Constants.TITLE_STYLE,
                    ),
                  ),
                  Padding(
                    padding: Constants.PADDING_LTRB,
                    child: Container(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text('50+',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('orders'),
                            ],
                          ),
                          Column(
                            children: [
                              Text('0',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('tokens'),
                            ],
                          ),
                          Column(
                            children: [
                              Text('2.0',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('credits'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: Constants.PADDING_LTRB,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/kenert.jpg'),
                ),
              )
            ]),
            Padding(
              padding: Constants.PADDING_LTRB,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Your favorites',
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
            ProfileFavorites(),
            Padding(
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
                      'Earn free deliveries',
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
                      'Enter promo code',
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
                      'Order history',
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
                ],
              ),
            ),
            Padding(
              padding: Constants.PADDING_LTRB,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Order again',
                    style: Constants.TITLE_STYLE,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.blue[50],
                    textColor: Colors.blue,
                    onPressed: () => {},
                    child: Text(
                      'History',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            OrderAgain(),
            Padding(
              padding: Constants.PADDING_FOR_QUICKLINKS,
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      'Settings',
                      style: Constants.TITLE_STYLE,
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      'Credits and Tokens',
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
                      'Payment methods',
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
                      'My Adresses',
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
                      'More settings',
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
            )
          ],
        ))
      ]),
    );
  }
}
