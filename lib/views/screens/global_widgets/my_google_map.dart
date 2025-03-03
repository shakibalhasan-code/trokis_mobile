import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trokis_mobile/core/services/map_services.dart';

class MyGoogleMap extends StatelessWidget {
  MyGoogleMap({super.key});

  final _mapServices = Get.find<MapServices>();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      zoomGesturesEnabled: true,
      myLocationEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: MapServices.kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        if (!_mapServices.controller.isCompleted) {
          _mapServices.controller.complete(controller);
        }
        _mapServices
            .fetchAndSetUserLocation(); // ✅ Ensure location is fetched on map creation
      },
      markers:
          _mapServices.markers.value, // ✅ Ensure markers are passed to the map
      // polylines: {
      //   Polyline(
      //     polylineId: const PolylineId("route"),
      //     points: _mapServices.polylineCoordinates,
      //     color: const Color(0xFF7B61FF),
      //     width: 6,
      //   ),
      // },
    );
  }
}
