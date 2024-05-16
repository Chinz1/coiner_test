import 'package:flutter/material.dart';
import 'package:coiner/bloc_map/map_bloc.dart';
import 'package:coiner/bloc_map/map_event.dart';
import 'package:coiner/bloc_map/map_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state is MapLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MapLoaded) {
            return GoogleMap(
              onMapCreated: (controller) {
                controller.animateCamera(
                  CameraUpdate.newLatLng(state.currentPosition),
                );
              },
              initialCameraPosition: CameraPosition(
                target: state.currentPosition,
                zoom: 10.0,
              ),
              markers: state.points.map((point) {
                return Marker(
                  markerId: MarkerId(point.toString()),
                  position: point,
                  infoWindow: InfoWindow(
                    title: 'Point',
                    snippet: 'Tap for more info',
                    onTap: () => _onMarkerTapped(context, point),
                  ),
                );
              }).toSet(),
              polylines: state.polylines,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            );
          } else if (state is MapError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }

  _onMarkerTapped(BuildContext context, LatLng point) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Point Description'),
          content: Text(
              'Description of the point at ${point.latitude}, ${point.longitude}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<MapBloc>(context).add(StartNavigation(point));
                Navigator.of(context).pop();
              },
              child: const Text('Navigate'),
            ),
          ],
        );
      },
    );
  }
}
