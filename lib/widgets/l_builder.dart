import 'package:flutter/material.dart';

import 'package:wolt_with_flutter/restaurantcards/l_card.dart';
import 'package:wolt_with_flutter/services/specials_service.dart';
import '../constants.dart' as constants;

class LBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 175,
        child: ListView(
            scrollDirection: Axis.horizontal,
            padding: constants.PADDING_LTRB,
            children: SpecialsService().getSpecials().map((object) {
              return LCard(specialObject: object); //Feature(photo);
            }).toList()));
  }
}
