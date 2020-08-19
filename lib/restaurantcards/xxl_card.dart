import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:wolt_with_flutter/pages/restaurant_page.dart';
import '../constants.dart' as constants;

class XXLCard extends StatelessWidget {
  XXLCard(
      {Key key,
      @required this.restoObject,
      this.favorite = false,
      this.isNewVenue = false})
      : super(key: key);

  final bool favorite;
  final bool isNewVenue;

//TODO Building the biggest card with a large picture, and details in the bottom part

//TODO TAG UUS! Wolt only to top left corner

  final RestaurantObject restoObject;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: constants.PADDING_LTRB,
      child: InkWell(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(children: [
              Stack(children: [
                Container(
                  width: 415,
                  height: 215,
                  child: Image.network(
                    restoObject.imageURL,
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
                favorite
                    ? Positioned(
                        top: 16,
                        right: 16,
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: () {}))
                    : Container(),
                isNewVenue
                    ? Positioned(
                        top: 16,
                        left: 16,
                        child: Card(
                          color: Colors.blue,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Center(
                                child: Text(
                              'NEW!',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ))
                    : Container(),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 113,
                    child: Column(
                      children: [
                        Text(
                          restoObject.title,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          restoObject.subtitle,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '${restoObject.baseEstimate} - ${restoObject.baseEstimate + 10}',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'min',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Text('Text')
            ]),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 2,
            // margin: EdgeInsets.symmetric(vertical: 10),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RestaurantPage(restoObject)));
          }),
    );
  }
}
