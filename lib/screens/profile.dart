import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/widgets/profile_page_header.dart';
import '../constants.dart' as constants;
import '../userdata.dart' as userdata;
import '../widgets/order_again.dart';
import '../widgets/profile_favorites.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(slivers: [
      SliverPersistentHeader(
        pinned: true,
        floating: false,
        delegate: ProfilePageHeader(),
      ),
      //TODO remove grey background
      SliverList(
          delegate: SliverChildListDelegate(
        [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: constants.PADDING_LTRB,
                  child: Text(
                    '${userdata.firstName} ${userdata.lastName}',
                    style: constants.TITLE_STYLE,
                  ),
                ),
                Padding(
                  padding: constants.PADDING_LTRB,
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text('${userdata.orderAmount}+',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('orders'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(userdata.tokenAmount.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('tokens'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(userdata.creditsLeft.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
              padding: constants.PADDING_LTRB,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(userdata.imageUrl),
              ),
            )
          ]),
          Padding(
            padding: constants.PADDING_LTRB,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Your favorites',
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
          ProfileFavorites(),
          Padding(
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
            padding: constants.PADDING_LTRB,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Order again',
                  style: constants.TITLE_STYLE,
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
          HistoryOrders(howMany: 3),
          Padding(
            padding: constants.PADDING_FOR_QUICKLINKS,
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                    'Settings',
                    style: constants.TITLE_STYLE,
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
    ]));
  }
}
