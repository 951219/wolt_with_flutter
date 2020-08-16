import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/special_object.dart';

class LCard extends StatelessWidget {
  LCard({Key key, @required this.specialObject}) : super(key: key);

  final SpecialObject specialObject;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 240,
                      height: 145,
                      child: Image.network(
                        specialObject.imageURL,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              specialObject.title,
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                  )
                                ],
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              specialObject.subtitle,
                              style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                    )
                                  ],
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))
                    //TODO add red container for new price
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 2,
              ),
            ]),
        onTap: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(specialObject.title),
              duration: Duration(seconds: 1),
            ),
          );

          //TODO special object to open a restaurant
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => RestaurantPage(specialObject.restaurant)));
        });
  }
}