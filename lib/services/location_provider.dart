import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatheroi/services/location_service.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;
  final LocationService _locationService = LocationService();
  Placemark? _currentLocationName;
  Placemark? get currentLocationName => _currentLocationName;
  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //Is Location Enabled
    if (!serviceEnabled) {
      _currentPosition = null;
      notifyListeners();
      return;
    }
    //Checking Permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _currentPosition = null;
        notifyListeners();
        return;
      }
      //If Permission Denied
      if (permission == LocationPermission.deniedForever) {
        _currentPosition = null;
        notifyListeners();
        return;
      }
      //To Get Location
      _currentPosition = await Geolocator.getCurrentPosition();
      _currentLocationName =
          await _locationService.getLocationName(_currentPosition);
      notifyListeners();
      print(_currentPosition);
      print(_currentLocationName);
    }
  }
}
