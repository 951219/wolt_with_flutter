import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_map/flutter_map.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:latlong/latlong.dart';

//TODO working with google
class Nearby1 extends StatelessWidget {
  const Nearby1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('maps'),
        ),
        body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(59.436962, 24.753574), zoom: 12),
        ));
  }
}
