import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/user_location.dart';
import 'package:wolt_with_flutter/widgets/collapsable_restaurant_page_header.dart';
import 'package:wolt_with_flutter/widgets/menu_builder.dart';
import '../constants.dart' as constants;

class RestaurantPage extends StatefulWidget {
  RestaurantPage(this.restoObject);

  final RestaurantObject restoObject;

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: CollapsableRestaurantPageHeader(
                  restoObject: widget.restoObject),
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
                          widget.restoObject.title,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: widget.restoObject.isFavorite
                              ? IconButton(
                                  splashRadius: 25,
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    super.setState(
                                      () {
                                        widget.restoObject.isFavorite = false;
                                      },
                                    );
                                  },
                                )
                              : IconButton(
                                  splashRadius: 25,
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.restoObject.isFavorite = true;
                                    });
                                  }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: constants.PADDING_LTRB,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.restoObject.subtitle),
                        Text(widget.restoObject.pricing)
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      child: widget.restoObject.rating >= 9
                          ? Text(' 😍')
                          : Text(' 😀'),
                    ),
                    title: Container(
                      child: widget.restoObject.rating >= 9
                          ? Text('Excellent   ${widget.restoObject.rating}')
                          : Text('Amazing   ${widget.restoObject.rating}'),
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
                        'Delivery in ${widget.restoObject.baseEstimate} - ${widget.restoObject.baseEstimate + 10} min'),
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
