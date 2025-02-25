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
              /// Google Map
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
                ),
              ),
              SizedBox(height: 8.h),

              /// Address Fields
              MyTextFeild(
                inputType: TextInputType.text,
                colorIcon: AppStyles.greyIconColor,
                suffixSVGIconPath: AppConstant.locationIcon,
                controller:
                    _userLocationController.destinationAddressController,
                hintText: 'Destination address',
              ),
              SizedBox(height: 8.h),

              MyTextFeild(
                inputType: TextInputType.text,
                colorIcon: AppStyles.greyIconColor,
                suffixSVGIconPath: AppConstant.locationIcon,
                controller: _userLocationController.secondAddressController,
                hintText: 'Address line 2 (Apt, suite, building, floor, etc.)',
              ),
              SizedBox(height: 8.h),

              /// Date & Time Pickers
              Row(
                children: [
                  Expanded(
                    child: MyTextFeild(
                      inputType: TextInputType.datetime,
                      controller: _userLocationController.dateController,
                      hintText: 'Select Date',
                      suffixSVGIconPath: AppConstant.dateIcon,
                      colorIcon: Color(0xff545454),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: MyTextFeild(
                      inputType: TextInputType.datetime,
                      controller: _userLocationController.timeController,
                      hintText: 'Select Time',
                      suffixSVGIconPath: AppConstant.timeIcon,
                      colorIcon: Color(0xff545454),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),

              /// Dropdowns (Location Type, Elevator, Parking)
              _buildDropdown(
                'Select Location Type',
                _userLocationController.selectedLocationType,
                _userLocationController.locationTypes,
              ),
              SizedBox(height: 8.h),
              WhiteCardWidget(
                  height: 60.h,
                  child: Row(
                    children: [
                      Text(
                        'Floor level',
                        style: AppStyles.titleMedium.copyWith(fontSize: 16.sp),
                      ),
                      const Spacer(),
                      Obx(
                        () => Text(
                          _userLocationController.selectedFloorLevel.value
                              .toString(),
                          style: AppStyles.titleMedium
                              .copyWith(fontSize: 16.sp, color: floorColor),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => incrementFloorLevel(),
                            child: Icon(Icons.keyboard_arrow_up_rounded,
                                color: Colors.black),
                          ),
                          InkWell(
                            onTap: () => decrementFloorLevel(),
                            child: Icon(Icons.keyboard_arrow_down_rounded,
                                color: Colors.black),
                          )
                        ],
                      )
                    ],
                  )),
              SizedBox(height: 8.h),

              _buildDropdown(
                'Is there any elevator?',
                _userLocationController.selectedElevatorType,
                _userLocationController.elevatorTypes,
              ),
              SizedBox(height: 8.h),

              _buildDropdown(
                'Choose Parking Type',
                _userLocationController.selectedParkingType,
                _userLocationController.parkingTypes,
              ),
              SizedBox(height: 8.h),

              /// Next Button
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  /// **Reusable Dropdown Widget**
  Widget _buildDropdown(
      String hint, RxString selectedValue, List<String> items) {
    return WhiteCardWidget(
      child: Obx(() => DropdownButton<String>(
            elevation: 1,
            hint: Text(hint),
            iconDisabledColor: Colors.black,
            icon: SvgPicture.asset(
              AppConstant.downArrowIcon,
              width: 20.w,
              height: 20.h,
              color: Colors.black,
            ),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            value: selectedValue.value,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: AppStyles.titleMedium.copyWith(fontSize: 16.sp),
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              if (newValue != null) {
                selectedValue.value = newValue;
              }
            },
            underline: SizedBox.shrink(),
            isExpanded: true,
          )),
    );
  }

  void incrementFloorLevel() {
    if (_userLocationController.selectedFloorLevel.value < 20) {
      _userLocationController.selectedFloorLevel.value++;
    }
  }

  void decrementFloorLevel() {
    if (_userLocationController.selectedFloorLevel.value > 0) {
      _userLocationController.selectedFloorLevel.value--;
    }
  }

  Color get floorColor {
    if (_userLocationController.selectedFloorLevel.value < 5) {
      return Colors.green;
    } else if (_userLocationController.selectedFloorLevel.value < 10) {
      return Colors.purple;
    } else if (_userLocationController.selectedFloorLevel.value < 15) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
