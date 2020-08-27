import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/special_object.dart';
import 'package:wolt_with_flutter/restaurantcards/l_card.dart';
import 'package:wolt_with_flutter/services/specials_service.dart';
import '../constants.dart' as constants;

class LBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: FutureBuilder(
        future: SpecialsService().fetchSpecials(),
        builder: (BuildContext context,
            AsyncSnapshot<List<SpecialObject>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
                scrollDirection: Axis.horizontal,
                padding: constants.PADDING_LTRB,
                children: snapshot.data.map(
                  (object) {
                    return LCard(specialObject: object);
                  },
                ).toList());
          } else {
            return Center(
              child: Text(
                'Loading...',
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            );
          }
        },
      ),
    );
  }
}
