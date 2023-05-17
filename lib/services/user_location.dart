import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class UserLocation extends ChangeNotifier {
  String currentAddress = "Fetching Location";
  Position? _currentPosition;
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      currentAddress = "Location Turned Off";
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        currentAddress = "Location Turned Off";
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      currentAddress = "Location Turned Off";
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition().then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress = "${place.street}, ${place.locality}, ${place.country} ";
    }).catchError((e) {
      debugPrint(e);
    });
    notifyListeners();
  }
}
