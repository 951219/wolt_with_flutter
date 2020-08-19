import 'package:flutter/material.dart';
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
    ));
  }
}

// TODO bottom blue bar, with building icon, address and a change button
// bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.blue,
//         items: [BottomNavigationBarItem(icon: Text('Change address'))],
//       ),
