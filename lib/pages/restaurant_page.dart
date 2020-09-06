import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/user_location.dart';
import 'package:wolt_with_flutter/widgets/collapsable_restaurant_page_header.dart';
import 'package:wolt_with_flutter/widgets/menu_builder.dart';
import '../constants.dart' as constants;

class RestaurantPage extends StatelessWidget {
  RestaurantPage(this.restoObject);

  final RestaurantObject restoObject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate:
                  CollapsableRestaurantPageHeader(restoObject: restoObject),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          restoObject.title,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: constants.PADDING_LTRB,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(restoObject.subtitle),
                        Text(restoObject.pricing)
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      child:
                          restoObject.rating >= 9 ? Text(' 😍') : Text(' 😀'),
                    ),
                    title: Container(
                      child: restoObject.rating >= 9
                          ? Text('Excellent   ${restoObject.rating}')
                          : Text('Amazing   ${restoObject.rating}'),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text('Open'),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blue[50],
                      textColor: Colors.blue,
                      onPressed: () => {},
                      child: Text(
                        'More info',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.motorcycle),
                    title: Text(
                        'Delivery in ${restoObject.baseEstimate} - ${restoObject.baseEstimate + 10} min'),
                    subtitle: FutureBuilder(
                        future: constants.userLocation,
                        builder: (BuildContext context,
                            AsyncSnapshot<UserLocation> snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data.address);
                          } else {
                            return Text('Loading...');
                          }
                        }),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blue[50],
                      textColor: Colors.blue,
                      onPressed: () => {},
                      child: Text(
                        'Change',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text('Order together'),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blue[50],
                      textColor: Colors.blue,
                      onPressed: () => {},
                      child: Text(
                        'Start now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  constants.PULL_DATA_FROM_WEB
                      ? MenuBuilder()
                      : Center(
                          child: Text('constants.PULL_DATA_FROM_WEB = false'),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
