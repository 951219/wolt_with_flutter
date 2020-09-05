import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:wolt_with_flutter/datamodels/user_location.dart';
import '../constants.dart' as constants;

class Nearby extends StatefulWidget {
  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: constants.userLocation,
        builder: (BuildContext context, AsyncSnapshot<UserLocation> snapshot) {
          if (snapshot.hasData) {
            LatLng location =
                LatLng(snapshot.data.latitude, snapshot.data.longitude);
            return ListView(children: [
              Container(
                height: 400,
                child: FlutterMap(
                  options: MapOptions(
                    center: location,
                    zoom: 13.0,
                  ),
                  layers: [
                    TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']),
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: location,
                          builder: (ctx) => Container(
                            child: IconButton(
                              icon: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 60,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  //TODO listview with card for restaurants - uses the same cards as delivery tab but iwhtout estimated time  and with approx distance from your location
                  height: 400,
                  child: Center(child: Text('Restaurants')))
            ]);
          } else {
            return Center(
              child: Container(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
            );
          }
        });
  }
}
