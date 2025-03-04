import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';

class ReviewHelperRequestScreen extends StatelessWidget {
  const ReviewHelperRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar:
          WidgetsHelper.showAppBar(title: 'Review your request', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Your booking is confirmed, thank you for choosing us!',
                  style: AppStyles.titleMedium
                      .copyWith(color: Colors.black, fontSize: 14.sp),
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
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///location
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Location',
                                style: AppStyles.titleMedium
                                    .copyWith(fontSize: 14.sp)),
                            Text('Rupatoli, Barishal',
                                style: AppStyles.titleMedium
                                    .copyWith(fontSize: 10.sp)),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          AppConstant.editIcon,
                          width: 24.w,
                          height: 24.h,
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),

                    ///date_time
                    Text('Date and Time',
                        style: AppStyles.titleMedium.copyWith(fontSize: 14.sp)),
                    Row(
                      children: [
                        Text(
                          'Date:',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          '12-12-2024',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                        ),
                        const Spacer(),
                        Text(
                          'Time:',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          '10:45am',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '10 helpers needed',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Estimate of hours: 5',
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
                      'Helpers details',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
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
            SizedBox(height: 10.h),
            Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return hired_item_build_method();
                    })),
            MyGlobButton(
              text: 'Next',
              isOutline: false,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget hired_item_build_method() {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hired Helpers',
                style: AppStyles.titleMedium
                    .copyWith(color: Colors.black, fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, // ✅ Fix alignment
                children: [
                  /// Avatar
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage(AppConstant.moverImage),
                  ),
                  SizedBox(width: 16.w),

                  /// Mover Details
                  Expanded(
                    // ✅ Fix: Ensures Column inside Row takes available space
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jane Cooper',
                          style: AppStyles.titleMedium.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp),
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
                        SizedBox(height: 8.h),

                        Text('See profile',
                            style: AppStyles.titleMedium.copyWith(
                                color: AppStyles.greenColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
