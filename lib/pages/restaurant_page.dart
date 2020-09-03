import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/widgets/collapsable_restaurant_page_header.dart';
import 'package:wolt_with_flutter/widgets/menu_builder.dart';
import '../constants.dart' as constants;

// TODO restaurant page
// TODO  pull random items to the menu
// TODO hero animation???

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
                  Divider(
                    thickness: 1,
                  ),
                  MenuBuilder()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
