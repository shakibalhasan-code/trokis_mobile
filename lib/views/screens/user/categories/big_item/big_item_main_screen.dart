import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:trokis_mobile/controller/user_app_controller/big_item_controller.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/grey_color_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_google_map.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_ripple_waver.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_text_feild.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/white_card_widget.dart';

class BigItemMainScreen extends StatelessWidget {
  BigItemMainScreen({super.key});
  final bigItemController = Get.find<BigItemController>();

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              Expanded(child: MyGoogleMap()),
              Obx(() {
                if (bigItemController.isDeliveryCompleted.value == true) {
                  return deliveryCompletedSection();
                } else if (bigItemController.currentSection.value ==
                    'transportation') {
                  return transPortationSection();
                } else if (bigItemController.currentSection.value ==
                    'finding') {
                  return finding_nearby_section();
                } else if (bigItemController.currentSection.value ==
                    'accepted') {
                  return driverArrivingSection();
                }
                return Container();
              }),
            ],
          ),
        ),
        Positioned(
          left: 24.w,
          top: padding.top + 20.h,
          child: InkWell(
            onTap: () => Get.back(),
            child: Container(
              width: 39.w,
              height: 38.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.r)),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Obx(() {
          if (bigItemController.currentSection.value == 'finding') {
            // Initially, show finding section
            if (!bigItemController.isShowMovers.value) {
              Future.delayed(Duration(seconds: 5), () {
                bigItemController.isShowMovers.value = true;
              });
              return finding_nearby_section();
            }
            // After 2 seconds, switch to movers
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Align(
                alignment: Alignment.center, // Moves items towards the bottom
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height *
                        0.4, // Limits height
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // Ensures the items don't take extra space
                      children: [
                        availableMoverItem(),
                        SizedBox(height: 10.h),
                        availableMoverItem(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Container(); // Default return when 'finding' is not active
        })
      ],
    ));
  }

  Container deliveryCompletedSection() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
          child: Column(
            children: [
              Row(
                children: [
                  MyRippleWaver(rippleColor: AppStyles.buttonGreen),
                  SizedBox(width: 5.w),
                  Text(
                    'Delivery complete!',
                    style: AppStyles.titleMedium.copyWith(fontSize: 16.sp),
                  )
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'Please confirm that your item(s) has been safely delivered to the destination.',
                style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
              ),

              ///terms_check_section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() {
                    return Checkbox(
                        value: bigItemController.isCheckTerms.value,
                        onChanged: (value) {
                          bigItemController.isCheckTerms.value = value!;
                        });
                  }),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Text(
                      'I confirm that my item(s) has been delivered and there is nothing pending.',
                      style: AppStyles.titleMedium.copyWith(fontSize: 10.sp),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: MyGlobButton(
                      text: 'Support',
                      isOutline: true,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: MyGlobButton(
                      text: 'Approve',
                      isOutline: false,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget driverArrivingSection() => Container(
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

  Padding availableMoverItem() {
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

  Container transPortationSection() {
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

  Widget finding_nearby_section() {
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
            MyGlobButton(text: 'Cancel services', isOutline: false),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
