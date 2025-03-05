import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';

class HelperSummaryScreen extends StatelessWidget {
  const HelperSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Summary', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  textAlign: TextAlign.center,
                  'Your booking is confirmed, thank you for choosing us!',
                  style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
                    ),
                    Text(
                      'Rupatoli, Barishal',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Date and Time',
                      style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          'Date: 12-12-2025',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                        ),
                        const Spacer(),
                        Text(
                          'Time: 10:45am',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Need help moving boxes',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '10 helpers needed',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Estimate of hours 5',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Deposit: \$50.000',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Due: \$450.000',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Helpers details',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: AppStyles.titleMedium.copyWith(fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return hired_helpers_item();
                  }),
            ),
            MyGlobButton(
                onTap: () => Get.offAllNamed(AppRoute.tab),
                text: 'Back to home',
                isOutline: false),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget hired_helpers_item() {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hired Helpers',
                style: AppStyles.titleMedium
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  SizedBox(
                    width: 54.w,
                    height: 54.h,
                    child: ClipRRect(
                      child: Image.asset(AppConstant.moverImage,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jane Cooper',
                          style: AppStyles.titleMedium.copyWith(
                              fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: AppStyles.ratingColor,
                            size: 14,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '5.0 (837 reviews)',
                            style:
                                AppStyles.titleMedium.copyWith(fontSize: 10.sp),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                        buttonColor: AppStyles.blueColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppConstant.mailIcon,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Send Message',
                              style: AppStyles.titleMedium.copyWith(
                                  fontSize: 12.sp, color: Colors.white),
                            )
                          ],
                        )),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: SecondaryButton(
                        buttonColor: AppStyles.buttonGreen,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.call, size: 24.sp, color: Colors.white),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Call',
                              style: AppStyles.titleMedium.copyWith(
                                  fontSize: 12.sp, color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
