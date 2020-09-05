import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:wolt_with_flutter/datamodels/user_location.dart';
import 'package:wolt_with_flutter/services/location_service.dart';

import '../constants.dart' as constants;

class CollapsableNearByTabHeader implements SliverPersistentHeaderDelegate {
  final double minExtent = 60;
  final double maxExtent = 280;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      height: 270,
      child: Opacity(
        opacity: titleOpacity(shrinkOffset),
        child: FutureBuilder(
          future: constants.userLocation ??=
              LocationService().pullLocationData(),
          builder:
              (BuildContext context, AsyncSnapshot<UserLocation> snapshot) {
            if (snapshot.hasData) {
              LatLng location =
                  LatLng(snapshot.data.latitude, snapshot.data.longitude);
              return Stack(children: [
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
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 60,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [Colors.grey.withOpacity(0), Colors.white],
                        stops: [0, 1],
                      ),
                    ),
                    width: 1000,
                    height: 100,
                  ),
                )
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
          },
        ),
      ),
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0

    return 1 - max(0, shrinkOffset) / maxExtent;

    // return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}