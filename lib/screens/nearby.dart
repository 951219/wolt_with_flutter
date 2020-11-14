import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/widgets/collapsable_bearby_tab_header.dart';
import 'package:wolt_with_flutter/widgets/xxl_builder.dart';

class Nearby extends StatefulWidget {
  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CollapsableNearByTabHeader(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [Container(color: Colors.white, child: XXLBuilder())],
            ),
          )
        ],
      ),
    );
  }
}
