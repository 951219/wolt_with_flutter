import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
// import 'package:wolt_with_flutter/services/locationservice.dart';
// import 'package:wolt_with_flutter/datamodels/user_location.dart';

//TODO https://stackoverflow.com/questions/49764905/how-to-assign-future-to-widget-in-flutter

//TODO listview with card for restaurants

class Nearby extends StatelessWidget {
  const Nearby({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(59.436962, 24.753574),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(59.436962, 24.753574),
              builder: (ctx) => new Container(
                child: IconButton(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 60,
                  ),
                  onPressed: () {
                    print('Marker tapped');
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
