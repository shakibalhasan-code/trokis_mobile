import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/controller/user_app_controller/line_waiting_controller.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';

class ReviewLineWaitingScreen extends StatelessWidget {
  ReviewLineWaitingScreen({super.key});

  final lineWaitingController = Get.find<LineWaitingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Review', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///location
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: AppStyles.titleMedium
                                  .copyWith(fontSize: 14.sp),
                            ),
                            Text(
                              'Rupatoli, Barishal',
                              style: AppStyles.titleMedium
                                  .copyWith(fontSize: 12.sp),
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '\$464',
                              style: AppStyles.titleMedium.copyWith(
                                  color: Colors.white, fontSize: 12.sp),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Apt, suite, building, floor, etc',
                      style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Date and Time',
                      style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
                    ),
                    Row(
                      children: [
                        SizedBox(height: 15.h),
                        Text(
                          'Date: 12-12-2024',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                        ),
                        const Spacer(),
                        Text(
                          'Time: 10:54 am',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Details',
                      style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(height: 10.h),

                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Text(
              ' View lease agreement with Driver >',
              style: AppStyles.titleMedium.copyWith(fontSize: 10.sp),
            ),
            SizedBox(height: 10.h),
            MyGlobButton(
                onTap: () => Get.toNamed(AppRoute.findingLineWaiting),
                text: 'Request',
                isOutline: false),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
