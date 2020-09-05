import 'package:cached_network_image/cached_network_image.dart';
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
                trailing: CachedNetworkImage(
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    fit: BoxFit.cover,
                    imageUrl: object.imgURL),
                children: [
                  // TODO menu item visual
                  Text(
                    object.contents.toString(),
                  ),
                ],
              );
            }).toList(),
          );
        } else {
          return Container(
            height: 250,
            width: 150,
            child: Center(
              child: SizedBox(
                height: 75,
                width: 75,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
