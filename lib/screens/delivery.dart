import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/user_location.dart';
import 'package:wolt_with_flutter/widgets/collapsable_page_header.dart';
import 'package:wolt_with_flutter/widgets/xxl_builder.dart';
import '../constants.dart' as constants;

class Delivery extends StatelessWidget {
  const Delivery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate:
                  CollapsableHeader(smallText: 'Delivery', bigText: 'Delivery'),
            ),
            SliverList(
                delegate: SliverChildListDelegate(XXLBuilder().getList()))
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.blue,
        child: ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.white,
            size: 17,
          ),
          //TODO space between icon and title should be smaller
          title: FutureBuilder(
            future: constants.userLocation,
            builder:
                (BuildContext context, AsyncSnapshot<UserLocation> snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.address,
                  style: TextStyle(color: Colors.white),
                );
              } else {
                return Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white),
                );
              }
            },
          ),

          trailing: Text('CHANGE',
              style: TextStyle(color: Colors.white, fontSize: 13)),
          dense: true,
          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
        ),
      ),
    ));
  }
}
