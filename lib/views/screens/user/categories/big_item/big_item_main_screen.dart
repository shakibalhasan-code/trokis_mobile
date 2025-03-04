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
import 'package:trokis_mobile/views/screens/user/categories/big_item/widget_helper/big_item_widget_helper.dart';

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
                  return BigItemWidgetHelper.transPortationSection(
                      bigItemController);
                } else if (bigItemController.currentSection.value ==
                    'finding') {
                  return BigItemWidgetHelper.finding_nearby_section();
                } else if (bigItemController.currentSection.value ==
                    'accepted') {
                  return BigItemWidgetHelper.driverArrivingSection(
                      bigItemController);
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
              return BigItemWidgetHelper.finding_nearby_section();
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
                        BigItemWidgetHelper.availableMoverItem(
                            bigItemController),
                        SizedBox(height: 10.h),
                        BigItemWidgetHelper.availableMoverItem(
                            bigItemController),
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
}
