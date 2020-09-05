import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:wolt_with_flutter/pages/restaurant_page.dart';

class XXLCard extends StatefulWidget {
  XXLCard({Key key, @required this.restoObject}) : super(key: key);

//TODO Building the biggest card with a large picture, and details in the bottom part

  final RestaurantObject restoObject;

  @override
  _XXLCardState createState() => _XXLCardState();
}

class _XXLCardState extends State<XXLCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: InkWell(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    width: 420,
                    height: 215,
                    child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        fit: BoxFit.cover,
                        imageUrl: widget.restoObject.imageURL),
                  ),
                  widget.restoObject.isFavorite
                      ? Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.restoObject.isFavorite = false;
                                });
                              }))
                      : Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.restoObject.isFavorite = true;
                                });
                              })),
                  widget.restoObject.isNew
                      ? Positioned(
                          top: 12,
                          left: 12,
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
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.restoObject.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.restoObject.subtitle,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 0,
                      color: Colors.grey[50],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              '${widget.restoObject.baseEstimate} - ${widget.restoObject.baseEstimate + 10}',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'min',
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Row(
                  children: [
                    Text(
                      widget.restoObject.pricing,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      ' • ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Delivery ${widget.restoObject.baseDeliveryPrice} €',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      ' • ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                        child: widget.restoObject.rating >= 9
                            ? Text(' 😍 ')
                            : Text(' 😀 ')),
                    Text(
                      widget.restoObject.rating.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ]),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 2,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RestaurantPage(widget.restoObject)));
          }),
    );
  }
}
