// import 'package:wolt_with_flutter/datamodels/deliverytabitem.dart';
import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/widgets/deliveryItems.dart';

class Delivery extends StatelessWidget {
  const Delivery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 55),
      child: DeliveryItems(),
    );
  }
}
