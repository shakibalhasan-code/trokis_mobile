import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';

class MapServices extends GetxService {
  Rx<LatLng> selectedLocation = LatLng(0.0, 0.0).obs;
  RxSet<Marker> markers = <Marker>{}.obs;
  BitmapDescriptor? customMarkerIcon;
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  PolylinePoints polylinePoints = PolylinePoints();

  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;

  List<LatLng> polylineCoordinates = [];

  var isLoading = false.obs;
  Rx<String> userAddress = "Your Location".obs;
  Rx<String> destinationAddress = "".obs;

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962), // Default location
    zoom: 14.4746,
  );

  @override
  void onInit() async {
    super.onInit();
    await fetchAndSetUserLocation();
    // getPolyPoints();
    // _loadCustomMarker();
  }

  /// ✅ Dispose the Google Map Controller
  void disposeController() async {
    if (controller.isCompleted) {
      final GoogleMapController mapController = await controller.future;
      mapController.dispose();
      controller = Completer(); // Reset the Completer
    }
  }

  // /// ✅ Load Custom Marker Icon
  // Future<void> _loadCustomMarker() async {
  //   customMarkerIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/marker.png');
  // }

  /// ✅ Get User's Current Location & Show Marker
  Future<void> fetchAndSetUserLocation() async {
    try {
      isLoading.value = true;
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar("Location Error", "Please enable location services.");
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          Get.snackbar("Permission Denied",
              "Location permissions are permanently denied.");
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      selectedLocation.value = LatLng(position.latitude, position.longitude);
      userAddress.value = await getAddressFromCoordinates(
          position.latitude, position.longitude);

      markers.add(
        Marker(
          markerId: MarkerId("user_location"),
          position: selectedLocation.value,
          icon: customMarkerIcon ??
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: "Your Location"),
        ),
      );

      markers.refresh();

      if (controller.isCompleted) {
        final GoogleMapController mapController = await controller.future;
        mapController.animateCamera(
            CameraUpdate.newLatLngZoom(selectedLocation.value, 15));
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to get location: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// ✅ Convert LatLng to Address
  Future<String> getAddressFromCoordinates(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      }
      return "No address found";
    } catch (e) {
      return "Error: $e";
    }
  }

  // void getPolyPoints() async {
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     googleApiKey: AppConstant.googleMapsApiKey,
  //     request: PolylineRequest(
  //         origin: PointLatLng(selectedLocation.value.latitude,
  //             selectedLocation.value.longitude),
  //         destination: PointLatLng(23.7788858, 90.3995682),
  //         mode: TravelMode.driving), // Your Google Map Key
  //   );
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach(
  //       (PointLatLng point) => polylineCoordinates.add(
  //         LatLng(point.latitude, point.longitude),
  //       ),
  //     );
  //   }
  // }
}
