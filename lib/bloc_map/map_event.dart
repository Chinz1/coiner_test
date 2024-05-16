import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapEvent {}

class LoadCurrentLocation extends MapEvent {}

class GenerateRandomPoints extends MapEvent {
  final LatLng center;

  GenerateRandomPoints(this.center);
}

class StartNavigation extends MapEvent {
  final LatLng destination;

  StartNavigation(this.destination);
}
