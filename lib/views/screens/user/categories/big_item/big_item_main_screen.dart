import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trokis_mobile/controller/user_app_controller/big_item_controller.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_google_map.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_text_feild.dart';
import 'package:trokis_mobile/views/screens/global_widgets/white_card_widget.dart';

class BigItemMainScreen extends StatelessWidget {
  BigItemMainScreen({super.key});
  final bigItemController = Get.find<BigItemController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: MyGoogleMap()),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Big item transportation',
                        style: AppStyles.titleMedium.copyWith(fontSize: 16.sp),
                      ),
                      SizedBox(height: 15.h),

                      // Pick up Location Text Field
                      MyTextFeild(
                        isEditable: true,
                        inputType: TextInputType.text,
                        colorIcon: AppStyles.greyIconColor,
                        suffixSVGIconPath: AppConstant.locationIcon,
                        controller:
                            bigItemController.destinationAddressController,
                        hintText: 'Pick up location',
                      ),
                      SizedBox(height: 10.h),

                      WhiteCardWidget(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          child: Text(
                            'Address line 2 (Apt, suite, building, floor, etc.)',
                            style:
                                AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      // Drop off Location Text Field
                      MyTextFeild(
                        isEditable: true,
                        inputType: TextInputType.text,
                        colorIcon: AppStyles.greyIconColor,
                        suffixSVGIconPath: AppConstant.locationIcon,
                        controller:
                            bigItemController.destinationAddressController,
                        hintText: 'Drop off Location',
                      ),
                      SizedBox(height: 10.h),

                      WhiteCardWidget(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          child: Text(
                            'Address line 2 (Apt, suite, building, floor, etc.)',
                            style:
                                AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      // Add Stops Button
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.add, color: Colors.black),
                          Text(
                            'Add stops',
                            style:
                                AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      // When do you need it?
                      Text(
                        'When do you need it?',
                        style: AppStyles.titleMedium.copyWith(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.h),

                      // Now or Schedule for later radio options
                      Row(
                        children: [
                          // "Now" option
                          GestureDetector(
                            onTap: () {
                              bigItemController.selectedTime.value = 'Now';
                            },
                            child: Obx(() => Icon(
                                  bigItemController.selectedTime.value == 'Now'
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color: Colors.black,
                                  size: 24,
                                )),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Now',
                            style:
                                AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                          ),
                          SizedBox(width: 20.w),

                          // "Schedule for later" option
                          GestureDetector(
                              onTap: () {
                                bigItemController.selectedTime.value =
                                    'Schedule for later';
                              },
                              child: Obx(
                                () => Icon(
                                  bigItemController.selectedTime.value ==
                                          'Schedule for later'
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              )),
                          SizedBox(width: 8.w),
                          Text(
                            'Schedule for later',
                            style:
                                AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Yes or No cargo help option
                              GestureDetector(
                                  onTap: () {
                                    bigItemController.selectedCargo.value =
                                        true;
                                  },
                                  child: Obx(
                                    () => Icon(
                                      bigItemController.selectedCargo.value
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  )),
                              SizedBox(width: 8.w),
                              Text(
                                'I will load and unload the cargo myself',
                                style: AppStyles.titleMedium
                                    .copyWith(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          SizedBox(width: 20.w),
                          Row(
                            children: [
                              // "I won’t help" option
                              GestureDetector(
                                  onTap: () {
                                    bigItemController.selectedCargo.value =
                                        false;
                                  },
                                  child: Obx(
                                    () => Icon(
                                      !bigItemController.selectedCargo.value
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  )),
                              SizedBox(width: 8.w),
                              Text(
                                "I won’t help to load and unload the cargo",
                                style: AppStyles.titleMedium
                                    .copyWith(fontSize: 12.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),

                      // Lease agreement link

                      MyGlobButton(text: 'Request', isOutline: false)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
