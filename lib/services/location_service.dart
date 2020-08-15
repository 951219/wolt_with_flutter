import 'package:geolocator/geolocator.dart';
import 'package:wolt_with_flutter/datamodels/user_location.dart';

class LocationService {
  Future<UserLocation> getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return UserLocation(
        latitude: position.latitude, longitude: position.longitude);
  }

// useful for the blue bar / address section
  Future<List<Placemark>> getLocationJson() async {
    List<Placemark> placemark =
        await Geolocator().placemarkFromCoordinates(52.2165157, 6.9437819);
    return placemark;
  }
}
