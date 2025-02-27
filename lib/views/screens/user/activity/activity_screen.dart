import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:trokis_mobile/core/services/map_services.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  final _mapServices = Get.find<MapServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// Fullscreen Google Map
          Expanded(
              child: Stack(
            children: [
              Positioned.fill(
                left: 0,
                right: 0,
                child: SizedBox(
                  width: double.infinity,
                  child: GoogleMap(
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
                    markers: _mapServices.markers
                        .value, // ✅ Ensure markers are passed to the map
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: RippleWave(
                              color: AppStyles.greenColor,
                              repeat: true,
                              child: const SizedBox()),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'Loading your belongings into the truck',
                            style: AppStyles.titleMedium
                                .copyWith(fontSize: 16.sp, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),

                    ///mover_profile_info
                    Row(
                      children: [
                        SizedBox(
                          width: 53.w,
                          height: 53.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
                            child: Image.asset(
                              AppConstant.moverImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sabbir Hossein',
                              style: AppStyles.titleMedium
                                  .copyWith(fontSize: 12.sp),
                            ),

                            /// Reviews
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: AppStyles.ratingColor, size: 18.r),
                                SizedBox(width: 5.w),
                                Text('5.0',
                                    style: AppStyles.titleMedium.copyWith(
                                        color: Colors.black, fontSize: 12.sp)),
                                SizedBox(width: 5.w),
                                Text('(837 Reviews)',
                                    style: AppStyles.titleMedium.copyWith(
                                        color: Color(0xff545454),
                                        fontSize: 12.sp)),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Text('704 jobs completed',
                                style: AppStyles.titleMedium.copyWith(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
