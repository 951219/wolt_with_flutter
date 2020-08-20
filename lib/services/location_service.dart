import 'package:geolocator/geolocator.dart';
import 'package:wolt_with_flutter/datamodels/user_location.dart';

class LocationService {
  Future<UserLocation> getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return UserLocation(
        latitude: position.latitude, longitude: position.longitude);
  }

  Future<List<Placemark>> getCurrentLocationAsAnAddress() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final List<Placemark> placemarks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);

    return placemarks;
  }
}
