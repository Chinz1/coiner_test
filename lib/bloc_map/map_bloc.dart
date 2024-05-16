import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_event.dart';
import 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<LoadCurrentLocation>((event, emit) async {
      emit(MapLoading());
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        final LatLng currentPosition =
            LatLng(position.latitude, position.longitude);
        add(GenerateRandomPoints(currentPosition));
      } catch (e) {
        emit(MapError('Failed to get current location'));
      }
    });

    on<GenerateRandomPoints>((event, emit) {
      final Random random = Random();
      final double radius =
          0.01; // Radius for generating random points (about 1km)
      final List<LatLng> points = [];
      for (int i = 0; i < 7; i++) {
        final double dx = radius * (random.nextDouble() - 0.5);
        final double dy = radius * (random.nextDouble() - 0.5);
        points.add(
            LatLng(event.center.latitude + dx, event.center.longitude + dy));
      }
      emit(MapLoaded(
        currentPosition: event.center,
        points: points,
        polylines: {},
      ));
    });

    on<StartNavigation>((event, emit) {
      if (state is MapLoaded) {
        final currentState = state as MapLoaded;
        final Set<Polyline> polylines = {
          Polyline(
            polylineId: PolylineId('route'),
            points: [currentState.currentPosition, event.destination],
            color: Colors.blue,
            width: 5,
          ),
        };
        emit(MapLoaded(
          currentPosition: currentState.currentPosition,
          points: currentState.points,
          polylines: polylines,
        ));
      }
    });
  }
}
