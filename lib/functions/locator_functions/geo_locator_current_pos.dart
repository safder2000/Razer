import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

// function for finding position on map🗺️📌

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}

// function for finding adress using position🗺️🏠📌
GetAddress(Position position) async {
  List<Placemark> placemark =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  return placemark;
}
