import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trokis_mobile/core/services/map_services.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class StartingLocationScreen extends StatelessWidget {
  StartingLocationScreen({super.key});

  final mapServices = Get.find<MapServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: Text(
          'Starting Location',
          style: AppStyles.titleMedium.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
              height: 368.h,
              width: double.infinity,
              child: Obx(() => GoogleMap(
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition: MapServices.kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  mapServices.controller.complete(controller);
                },
                onTap: (LatLng latLng) {
                  mapServices.updateSelectedLocation(latLng); // Call function to update marker
                },
                markers: mapServices.markers,
              )),
            )
          ],
        ),
      ),
    );
  }
}
