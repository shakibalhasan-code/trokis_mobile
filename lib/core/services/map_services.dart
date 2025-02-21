import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapServices extends GetxService {
  Rx<LatLng> selectedLocation = LatLng(0.0, 0.0).obs;
  RxSet<Marker> markers = <Marker>{}.obs;
  BitmapDescriptor? customMarkerIcon; // Custom marker icon

  final Completer<GoogleMapController> controller =
  Completer<GoogleMapController>();

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void onInit() {
    super.onInit();
    // _loadCustomMarker(); // Load the marker on startup
  }

  // // Load the custom marker icon
  // Future<void> _loadCustomMarker() async {
  //   customMarkerIcon = await BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(size: Size(48, 48)), // Resize marker
  //     "assets/images/red_marker.png", // Ensure this file exists
  //   );
  // }

  // Update the selected location and change the marker
  void updateSelectedLocation(LatLng newLocation) {
    selectedLocation.value = newLocation;

    markers.value = {
      Marker(
        markerId: MarkerId("selected_location"),
        position: newLocation,
        icon:  BitmapDescriptor.defaultMarker, // Custom icon
        infoWindow: InfoWindow(title: "Selected Location"),
      ),
    };
  }
}
