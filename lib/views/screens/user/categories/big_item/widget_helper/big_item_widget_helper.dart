import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:trokis_mobile/controller/user_app_controller/big_item_controller.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/grey_color_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_text_feild.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';

class BigItemWidgetHelper {
  static Widget driverArrivingSection(BigItemController bigItemController) =>
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text('Arriving at 2:32pm',
                          style: AppStyles.titleMedium.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Icon(Icons.share, color: Colors.black)
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: RippleWave(
                          child: SizedBox(), color: AppStyles.buttonGreen)),
                  SizedBox(width: 8.w),
                  Text(
                    'On the way to pick up location',
                    style: AppStyles.titleMedium.copyWith(fontSize: 16.sp),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  ///profile
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60.h,
                          width: 60.w,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 50.w,
                                height: 50.h,
                                child: ClipRRect(
                                  child: Image.asset(AppConstant.moverImage,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(2.r)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        size: 11,
                                        Icons.star,
                                        color: AppStyles.ratingColor,
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        '5.0',
                                        style: AppStyles.titleMedium
                                            .copyWith(fontSize: 10.sp),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text('Sabbir Hossein',
                            style:
                                AppStyles.titleMedium.copyWith(fontSize: 14.sp))
                      ],
                    ),
                  ),

                  ///car
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('CPN698',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 14.sp)),
                      SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: ClipRRect(
                          child: Image.asset(
                            AppConstant.carImage,
                          ),
                        ),
                      ),
                      Text('White Nissan NP300',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 14.sp)),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 15.h,
              ),

              ///CONTACT SECTION
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                        buttonColor: AppStyles.buttonGreen,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppConstant.messageIcon,
                                width: 20.w,
                                height: 20.h,
                                color: Colors.white,
                              ),
                              SizedBox(width: 15.w),
                              Text(
                                'Send a message',
                                style: AppStyles.titleMedium.copyWith(
                                    color: Colors.white, fontSize: 14.sp),
                              )
                            ],
                          ),
                        )),
                  ),
                  SizedBox(width: 40.w),
                  InkWell(
                    onTap: () {
                      bigItemController.isDeliveryCompleted.value = true;
                    },
                    child: Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          color: AppStyles.buttonGreen,
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );

  static Padding availableMoverItem(BigItemController bigItemController) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 49.w,
                    height: 49.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Image.asset(AppConstant.moverImage)),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Santiago Dslab',
                        style: AppStyles.titleMedium.copyWith(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
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
                                  color: Color(0xff545454), fontSize: 12.sp)),
                        ],
                      ),
                      SizedBox(height: 5.h),

                      Text('704 jobs completed',
                          style: AppStyles.titleMedium.copyWith(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text('\$19.00',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 14.w)),
                      Text('5min',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 10.w)),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppConstant.truckIcon,
                            width: 18.w,
                            height: 18.h,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(child: GreyColorButton(buttonText: 'Decline')),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                      child: MyGlobButton(
                    onTap: () {
                      bigItemController.currentSection.value = 'accepted';
                    },
                    text: 'Accept',
                    isOutline: false,
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static Container transPortationSection(BigItemController bigItemController) {
    return Container(
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
                controller: bigItemController.destinationAddressController,
                hintText: 'Pick up location',
              ),
              SizedBox(height: 10.h),

              // address2
              MyTextFeild(
                isEditable: true,
                inputType: TextInputType.text,
                colorIcon: AppStyles.greyIconColor,
                suffixSVGIconPath: AppConstant.locationIcon,
                controller: bigItemController.destinationAddressController,
                hintText: 'Address line 2 (Apt, suite, building, floor, etc.)',
              ),
              SizedBox(height: 10.h),

              // Drop off Location Text Field
              MyTextFeild(
                isEditable: true,
                inputType: TextInputType.text,
                colorIcon: AppStyles.greyIconColor,
                suffixSVGIconPath: AppConstant.locationIcon,
                controller: bigItemController.destinationAddressController,
                hintText: 'Drop off Location',
              ),
              SizedBox(height: 10.h),

              // address2
              MyTextFeild(
                isEditable: true,
                inputType: TextInputType.text,
                colorIcon: AppStyles.greyIconColor,
                suffixSVGIconPath: AppConstant.locationIcon,
                controller: bigItemController.destinationAddressController,
                hintText: 'Address line 2 (Apt, suite, building, floor, etc.)',
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
                    style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              // When do you need it?
              Text(
                'When do you need it?',
                style: AppStyles.titleMedium
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
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
                    style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
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
                    style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
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
                            bigItemController.selectedCargo.value = true;
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
                        style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Row(
                    children: [
                      // "I won’t help" option
                      GestureDetector(
                          onTap: () {
                            bigItemController.selectedCargo.value = false;
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
                        style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.h),

              // Lease agreement link

              MyGlobButton(
                text: 'Request',
                isOutline: false,
                onTap: () {
                  bigItemController.currentSection.value = 'finding';
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget finding_nearby_section() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Finding nearby rides...',
                  style: AppStyles.titleMedium
                      .copyWith(color: Colors.black, fontSize: 16.sp),
                ),
                SizedBox(
                  width: 5.w,
                ),
                // MyRippleWaver(rippleColor: Colors.blue)
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pickup location',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 14.sp)),
                      Text('Rupatoli, Barishal',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 12.sp))
                    ],
                  ),
                ),
                SizedBox(width: 5.w),
                const VerticalDivider(
                  width: 1,
                  color: Colors.grey,
                ),
                SizedBox(width: 5.w),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivery location',
                        style: AppStyles.titleMedium.copyWith(fontSize: 14.sp)),
                    Text('Banasree, Dhaka.',
                        style: AppStyles.titleMedium.copyWith(fontSize: 12.sp))
                  ],
                ))
              ],
            ),
            SizedBox(height: 10.h),
            MyGlobButton(
              text: 'Cancel services',
              isOutline: false,
              onTap: () {
                showCancelDialog();
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  static void showCancelDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure you want to cancel?',
              textAlign: TextAlign.center,
              style: AppStyles.titleMedium.copyWith(fontSize: 16.sp),
            ),
            const Divider(),
            SizedBox(height: 8.h),
            Text(
              'We’re already looking for a car. It won’t be long. If you cancel now, it may take longer to find one again.',
              textAlign: TextAlign.center,
              style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SecondaryButton(
                    buttonColor: AppStyles.simpleGrey,
                    child: Center(
                      child: Text(
                        'Cancel',
                        style:
                            AppStyles.titleMedium.copyWith(color: Colors.black),
                      ),
                    ),
                    onTap: () {
                      Get.back(); // Close the dialog
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SecondaryButton(
                    buttonColor: Colors.red,
                    child: Center(
                      child: Text(
                        'Yes',
                        style:
                            AppStyles.titleMedium.copyWith(color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      Get.back(); // Close the dialog
                      // Perform additional actions for cancellation
                      print('Order cancelled');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
