import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class LocationService {
  Location location = Location();

  Future<void> checkAndRequestLocationService() async {
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        throw LocationServiceException();
      }
    }
  }

  Future<void> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw LocationPermissionException();
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationPermissionException();
      }
    }
  }

  void getRealTimeLocationData(void Function(LocationData)? onData) async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getLocation() async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    return await location.getLocation();
  }

  Future< List<geocoding.Placemark> > getDetailsAddressByLatLong({
    bool isMyLocation = false,
    LatLng? latLng,
  }) async {
    var data = isMyLocation
        ? await location.getLocation()
        : null; // Get latitude & longitude

    // print(data.latitude!);
    // print(data.longitude!);

    List<geocoding.Placemark> placeMark =
        await geocoding.placemarkFromCoordinates(
            isMyLocation ? data!.latitude! : latLng!.latitude,
            isMyLocation ? data!.longitude! : latLng!.longitude);
    if (placeMark.isNotEmpty) {
      // List<geocoding.Placemark> place = placeMark;

      // print("length: ${placeMark.length}");
      // print("places: $placeMark");
      // print("City: ${place.locality}");
      // print("Country: ${place.country}");
      // print("Postal Code: ${place.postalCode}");
      // print("Administrative Area: ${place.administrativeArea}");
      // print("Sub Administrative Area: ${place.subAdministrativeArea}");
      // print("Thoroughfare: ${place.thoroughfare}");
      // print("Sub Thoroughfare: ${place.subThoroughfare}");
      // String address =
      //     "${place.name}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea} ${place.postalCode}, ${place.country}";
      // print(address);
    }

    return placeMark;
  }

  Future<List<geocoding.Location>> getDetailsAddressByAddress(
      String address) async {
    List<geocoding.Location> placeMarks =
        await geocoding.locationFromAddress(address);
    // print(placeMarks);
    return placeMarks;
  }
}

class LocationServiceException implements Exception {}

class LocationPermissionException implements Exception {}
