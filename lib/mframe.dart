import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
          addMarker();
        });
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(-6.8680927, 107.5354558), // San Francisco coordinates
        zoom: 16.0,
      ),
      markers: markers,
    );

  }
  void addMarker(){
    Marker newMarker = Marker(
      markerId: MarkerId("1"), // A unique identifier for the marker
      position: LatLng(-6.8680927, 107.5354558), // Marker position
      infoWindow: InfoWindow(
        title: "Tirta Raharja",
        snippet: "Perusahaan",
      ),
    );

    // Add the marker to the set of markers
    markers.add(newMarker);

    // Update the map to display the new marker
    mapController.animateCamera(CameraUpdate.newLatLng(newMarker.position));
  }
}