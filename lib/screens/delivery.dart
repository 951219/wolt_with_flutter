import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/services/location_service.dart';
import 'package:wolt_with_flutter/widgets/collapsable_page_header.dart';
import 'package:wolt_with_flutter/widgets/xxl_builder.dart';

class Delivery extends StatelessWidget {
  const Delivery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(slivers: [
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate:
              CollapsableHeader(smallText: 'Delivery', bigText: 'Delivery'),
        ),
        SliverList(delegate: SliverChildListDelegate(XXLBuilder().getList()))
      ]),
      bottomSheet: Container(
        color: Colors.blue,
        child: ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.white,
          ),
          title: Text('address', style: TextStyle(color: Colors.white)),
          trailing: Text('CHANGE', style: TextStyle(color: Colors.white)),
          dense: true,
          visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
        ),
      ),
    ));
  }
}
