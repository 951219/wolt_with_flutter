import 'package:flutter/material.dart';
import '../widgets/exclusivity_banner.dart';
import '../widgets/profile_favorites.dart';

import '../constants.dart' as Constants;
//TODO add Sliver maybe?

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        SizedBox(height: 100), //temporary
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: Constants.PADDING_LTRB,
                child: Text(
                  'Kenert Karu',
                  style: Constants.LINKS_TITLE_STYLE,
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('orders'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('0',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('tokens'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('2.0',
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
                style: Constants.LINKS_TITLE_STYLE,
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
        //TODO restode list siia,
        ProfileFavorites(),
        //TODO quick links siia - earn free deliveries, Enter a promo code, CS, Order history
        Padding(
          padding: Constants.PADDING_FOR_QUICKLINKS,
          child: Column(
            children: [
              ListTile(
                leading: Text(
                  'Quick links',
                  style: Constants.LINKS_TITLE_STYLE,
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
                style: Constants.LINKS_TITLE_STYLE,
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
        //TODO resto list siia,
        Padding(
          padding: Constants.PADDING_FOR_QUICKLINKS,
          child: Column(
            children: [
              ListTile(
                leading: Text(
                  'Settings',
                  style: Constants.LINKS_TITLE_STYLE,
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
    ));
  }
}
