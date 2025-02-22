import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trokis_mobile/controller/user_app_controller/user_starting_location_controller.dart';
import 'package:trokis_mobile/core/services/map_services.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_text_feild.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/white_card_widget.dart';

class StartingLocationScreen extends StatelessWidget {
  StartingLocationScreen({super.key});

  final _mapServices = Get.find<MapServices>();
  final _userLocationController = Get.find<UserStartingLocationController>();

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
                height: 368.h,
                width: double.infinity,
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: true,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition: MapServices.kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _mapServices.controller.complete(controller);
                  },
                  // onTap: (LatLng latLng) {
                  //   mapServices.updateSelectedLocation(latLng); // Call function to update marker
                  // },
                  // markers: mapServices.markers,
                ),
              ),
              SizedBox(height: 8.h),
              MyTextFeild(
                  inputType: TextInputType.text,
                  colorIcon: AppStyles.greyIconColor,
                  suffixSVGIconPath: AppConstant.locationIcon,
                  controller:
                      _userLocationController.destinationAddressController,
                  hintText: 'Destination address'),
              SizedBox(height: 8.h),
              MyTextFeild(
                  inputType: TextInputType.text,
                  colorIcon: AppStyles.greyIconColor,
                  suffixSVGIconPath: AppConstant.locationIcon,
                  controller:
                      _userLocationController.destinationAddressController,
                  hintText:
                      'Address line 2 (Apt, suite, building, floor, etc.)'),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: MyTextFeild(
                        inputType: TextInputType.datetime,
                        controller: _userLocationController.dateController,
                        hintText: 'Select Date',
                        suffixSVGIconPath: AppConstant.dateIcon,
                        colorIcon: Colors.black),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: MyTextFeild(
                        inputType: TextInputType.datetime,
                        controller: _userLocationController.timeController,
                        hintText: 'Select Time',
                        suffixSVGIconPath: AppConstant.timeIcon,
                        colorIcon: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              WhiteCardWidget(
                child: Obx(() => DropdownButton<String>(
                      elevation: 1,
                      iconDisabledColor: Colors.black,
                      icon: SvgPicture.asset(
                        AppConstant.downArrowIcon,
                        width: 20.w,
                        height: 20.h,
                        color: Colors.black,
                      ),
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      value: _userLocationController.selectedLocationType
                          .value, // Use the observable variable
                      items:
                          _userLocationController.locationTypes.map((location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(
                            location,
                            style:
                                AppStyles.titleMedium.copyWith(fontSize: 16.sp),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        _userLocationController.selectedElevatorType.value =
                            newValue!;
                        print(newValue);
                      },
                      underline: SizedBox.shrink(), // Remove underline
                      isExpanded:
                          true, // Ensure the dropdown takes the full width
                    )),
              ),
              SizedBox(height: 8.h),
              WhiteCardWidget(
                child: Obx(() => DropdownButton<String>(
                      elevation: 1,
                      iconDisabledColor: Colors.black,
                      icon: SvgPicture.asset(
                        AppConstant.downArrowIcon,
                        width: 20.w,
                        height: 20.h,
                        color: Colors.black,
                      ),
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      value: _userLocationController.selectedElevatorType
                          .value, // Use the observable variable
                      items:
                          _userLocationController.elevatorTypes.map((location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(
                            location,
                            style:
                                AppStyles.titleMedium.copyWith(fontSize: 16.sp),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        _userLocationController.selectedElevatorType.value =
                            newValue!;
                        print(newValue);
                      },
                      underline: SizedBox.shrink(), // Remove underline
                      isExpanded:
                          true, // Ensure the dropdown takes the full width
                    )),
              ),
              SizedBox(height: 8.h),
              WhiteCardWidget(
                child: Obx(() => DropdownButton<String>(
                      elevation: 1,
                      iconDisabledColor: Colors.black,
                      icon: SvgPicture.asset(
                        AppConstant.downArrowIcon,
                        width: 20.w,
                        height: 20.h,
                        color: Colors.black,
                      ),
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      value: _userLocationController.selectedElevatorType
                          .value, // Use the observable variable
                      items:
                          _userLocationController.elevatorTypes.map((location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(
                            location,
                            style:
                                AppStyles.titleMedium.copyWith(fontSize: 16.sp),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        _userLocationController.selectedElevatorType.value =
                            newValue!;
                        print(newValue);
                      },
                      underline: SizedBox.shrink(), // Remove underline
                      isExpanded:
                          true, // Ensure the dropdown takes the full width
                    )),
              ),
              SizedBox(height: 8.h),
              SecondaryButton(
                  onTap: () => Get.toNamed(AppRoute.itemSelection),
                  buttonColor: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.center,
                            'Next',
                            style: AppStyles.titleMedium
                                .copyWith(color: Colors.white, fontSize: 18.sp),
                          ),
                        ),
                        SvgPicture.asset(
                          AppConstant.nextIcon,
                          width: 24.w,
                          height: 24.h,
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
