import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/dish_object.dart';
import 'package:wolt_with_flutter/services/dish_service.dart';

class MenuBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DishService().pullRandomMenu(),
      builder:
          (BuildContext context, AsyncSnapshot<List<DishObject>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: snapshot.data.map((object) {
              return ExpansionTile(
                title: Text(
                  object.title,
                  style: TextStyle(color: Colors.black),
                ),
                trailing: Image(image: NetworkImage(object.imgURL)),
                children: [
                  Image(height: 200, image: NetworkImage(object.imgURL)),
                  Text(
                    object.contents.toString(),
                  ),
                ],
              );
            }).toList(),
          );
        } else {
          return Center(
            child: Text(
              'Loading...',
              style: TextStyle(fontSize: 13),
            ),
          );
        }
      },
    );
  }
}
