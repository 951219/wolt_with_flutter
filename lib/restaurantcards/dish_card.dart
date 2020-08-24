import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/dish_object.dart';

class DishCard extends StatelessWidget {
  DishCard({Key key, @required this.dishObject}) : super(key: key);

  final DishObject dishObject;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Stack(
          children: <Widget>[
            Container(
              width: 210,
              height: 140,
              child: Image.network(
                dishObject.imgUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                //TODO if text is too long, then it should break
                dishObject.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 3,
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      ),
      onTap: () {},
    );
  }
}
