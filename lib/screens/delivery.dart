import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/widgets/delivery_tab_items.dart';

class Delivery extends StatelessWidget {
  const Delivery({
    Key key,
  }) : super(key: key);

  //TODO  Appbar saying "Delivery"
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 55),
      child: DeliveryItems(),
    );
  }

  // TODO bottom blue bar, with building icon, address and a change button
}
