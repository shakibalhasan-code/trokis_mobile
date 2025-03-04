import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:trokis_mobile/controller/user_app_controller/user_starting_location_controller.dart';
import 'package:trokis_mobile/core/services/map_services.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_text_feild.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/white_card_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartingLocationScreen extends StatelessWidget {
  StartingLocationScreen({super.key});

  final _mapServices = Get.find<MapServices>();
  final _userLocationController = Get.find<UserStartingLocationController>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
      body: Stack(
        children: [
          /// Fullscreen Google Map
          Positioned.fill(
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
                // _mapServices
                //     .fetchAndSetUserLocation(); // ✅ Ensure location is fetched on map creation
              },
              // markers: _mapServices
              //     .markers.value, // ✅ Ensure markers are passed to the map
              // polylines: {
              //   Polyline(
              //     polylineId: const PolylineId("route"),
              //     points: _mapServices.polylineCoordinates,
              //     color: const Color(0xFF7B61FF),
              //     width: 6,
              //   ),
              // },
            ),
          ),

          /// Draggable Scrollable Bottom Sheet with all fields
          DraggableScrollableSheet(
            initialChildSize: 0.18.h,
            minChildSize: 0.18.h,
            maxChildSize: 0.80,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.all(15.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Drag Handle
                      Center(
                        child: Container(
                          width: 50.w,
                          height: 5.h,
                          margin: EdgeInsets.symmetric(vertical: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),

                      /// Title
                      Text(
                        'Set your destination',
                        style: AppStyles.titleMedium.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'Drag map to move on ',
                        style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 8.h),
                      const Divider(),

                      /// Address Fields
                      MyTextFeild(
                          isEditable: true,
                          inputType: TextInputType.text,
                          colorIcon: AppStyles.greyIconColor,
                          suffixSVGIconPath: AppConstant.locationIcon,
                          controller: _userLocationController
                              .destinationAddressController,
                          hintText: 'Destination Address'),
                      SizedBox(height: 8.h),

                      MyTextFeild(
                        inputType: TextInputType.text,
                        colorIcon: AppStyles.greyIconColor,
                        suffixSVGIconPath: AppConstant.locationIcon,
                        controller:
                            _userLocationController.secondAddressController,
                        hintText:
                            'Address line 2 (Apt, suite, building, floor, etc.)',
                      ),
                      SizedBox(height: 8.h),

                      /// Date & Time Pickers
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final date =
                                    await _userLocationController.selectDate();
                                if (date != null) {
                                  _userLocationController.selectedDate.value =
                                      date.toString().split(' ')[0];
                                }
                              },
                              child: Obx(() => MyTextFeild(
                                    isEditable: false,
                                    inputType: TextInputType.datetime,
                                    controller:
                                        _userLocationController.dateController,
                                    hintText: _userLocationController
                                        .selectedDate.value,
                                    suffixSVGIconPath: AppConstant.dateIcon,
                                    colorIcon: Color(0xff545454),
                                  )),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                await _userLocationController.selectTime();
                              },
                              child: Obx(() => MyTextFeild(
                                    isEditable: false,
                                    inputType: TextInputType.datetime,
                                    controller:
                                        _userLocationController.timeController,
                                    hintText: _userLocationController
                                        .selectedTime.value,
                                    suffixSVGIconPath: AppConstant.timeIcon,
                                    colorIcon: Color(0xff545454),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),

                      /// Dropdown Fields
                      _buildDropdown(
                        'Select Location Type',
                        _userLocationController.selectedLocationType,
                        _userLocationController.locationTypes,
                      ),
                      SizedBox(height: 8.h),

                      /// Floor Level Selector
                      WhiteCardWidget(
                        height: 55.h,
                        child: Row(
                          children: [
                            Text(
                              'Floor level',
                              style: AppStyles.titleMedium
                                  .copyWith(fontSize: 16.sp),
                            ),
                            Spacer(),
                            Obx(
                              () => Text(
                                _userLocationController.selectedFloorLevel.value
                                    .toString(),
                                style: AppStyles.titleMedium.copyWith(
                                    fontSize: 16.sp, color: floorColor),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
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
                        child: Center(
                          child: Text(
                            'Next',
                            style: AppStyles.titleMedium
                                .copyWith(color: Colors.white, fontSize: 18.sp),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              );
            },
          ),

          ///top_back button
          Positioned(
            left: 20.w,
            top: devicePadding.top * 2,
            child: InkWell(
              onTap: () => Get.back(),
              child: Card(
                color: Colors.white,
                elevation: 1.r,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Icon(
                      size: 28.h,
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Obx(() => _mapServices.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    )
                  : SizedBox.shrink())),
        ],
      ),
    );
  }

  /// **Reusable Dropdown Widget**
  Widget _buildDropdown(
      String hint, RxString selectedValue, List<String> items) {
    return WhiteCardWidget(
      child: Obx(
        () => DropdownButton<String>(
          elevation: 1,
          hint: Text(hint),
          iconDisabledColor: Colors.black,
          icon: SvgPicture.asset(
            AppConstant.downArrowIcon,
            width: 20,
            height: 20,
            color: Colors.black,
          ),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          value: selectedValue.value,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: AppStyles.titleMedium.copyWith(fontSize: 16),
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
        ),
      ),
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
