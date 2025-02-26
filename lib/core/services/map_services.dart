import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapServices extends GetxService {
  Rx<LatLng> selectedLocation = LatLng(0.0, 0.0).obs;
  RxSet<Marker> markers = <Marker>{}.obs;
  BitmapDescriptor? customMarkerIcon;
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  var isLoading = false.obs;

  Rx<String> userAddress = "Destination Address".obs;

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962), // Default location
    zoom: 14.4746,
  );

  @override
  void onInit() async {
    super.onInit();
    await fetchAndSetUserLocation(); // ✅ Automatically load user location
    _loadCustomMarker();
  }

  /// ✅ Load Custom Marker Icon
  Future<void> _loadCustomMarker() async {
    customMarkerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5, size: Size(12.w, 12.h)),
        'assets/images/marker.png');
  }

  /// ✅ Get User's Current Location & Show Marker
  Future<void> fetchAndSetUserLocation() async {
    try {
      isLoading.value = true;
      bool serviceEnabled;
      LocationPermission permission;

      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar("Location Error", "Please enable location services.");
        return;
      }

      // Request permissions if not granted
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          Get.snackbar("Permission Denied",
              "Location permissions are permanently denied.");
          return;
        }
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Update selected location
      selectedLocation.value = LatLng(position.latitude, position.longitude);
      userAddress.value = await getAddressFromCoordinates(
          position.latitude, position.longitude);
      // ✅ Ensure Marker is Added
      markers.add(
        Marker(
          markerId: MarkerId("user_location"),
          position: selectedLocation.value,
          icon: customMarkerIcon ??
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: "Your Location"),
        ),
      );

      markers.refresh(); // ✅ Ensure UI updates with new marker

      // ✅ Move Camera to User Location
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

  Future<String> getAddressFromCoordinates(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      } else {
        return "No address found";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
