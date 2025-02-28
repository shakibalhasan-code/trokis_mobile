import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/white_card_widget.dart';
import 'package:trokis_mobile/views/screens/user/moving/helper_widget/moving_widgets_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Profile'),
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile Picture and Name Section
            Row(
              children: [
                SizedBox(
                  width: 80.w,
                  height: 80.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Image.asset(AppConstant.moverImage),
                  ),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jane Cooper',
                      style: AppStyles.titleMedium.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.star,
                            color: AppStyles.ratingColor, size: 18.h),
                        SizedBox(width: 3.w),
                        Text(
                          '5.0 (123 reviews)',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),

            SizedBox(height: 15.h),

            /// Profile Description Section
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, I’m john and I have been doing moves for over 10 years, I’m very careful with my client’s furniture and appliances, I bring to two people with me and you can be confident that your move is in the best hands',
                      style: AppStyles.titleMedium.copyWith(fontSize: 10.sp),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildStatColumn('Total Moving:', '132'),
                        buildStatColumn('Vehicle:', 'Truck'),
                        buildStatColumn('Helpers:', '2'),
                        buildStatColumn('Experience:', '8 years'),
                      ],
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 12.h),

            /// Photos Section
            Text('Photos',
                style: AppStyles.titleMedium
                    .copyWith(color: Colors.black, fontSize: 16.sp)),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                    child: buildPhotoSectionItem(AppConstant.beedRoomImage)),
                SizedBox(width: 10.w),
                Expanded(
                    child: buildPhotoSectionItem(AppConstant.beedRoomImage)),
                SizedBox(width: 10.w),
                Expanded(
                    child: buildPhotoSectionItem(AppConstant.beedRoomImage)),
              ],
            ),
            SizedBox(height: 15.h),
            build_review_item_mover(),
            SizedBox(height: 5.h),

            build_review_item_mover(),

            SizedBox(height: 8.h),
            MyGlobButton(text: 'Hire', isOutline: false)
          ],
        ),
      ),
    );
  }

  Container build_review_item_mover() {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 40.w,
              height: 40.h,
              child: Image.asset(AppConstant.moverImage),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jane Cooper',
                    style: AppStyles.titleMedium
                        .copyWith(color: Colors.black, fontSize: 14.sp),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ',
                    style: AppStyles.titleMedium
                        .copyWith(color: Colors.black, fontSize: 10.sp),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppStyles.ratingColor,
                  size: 18.sp,
                ),
                SizedBox(width: 5.w),
                Text(
                  '5.0',
                  style: AppStyles.titleMedium.copyWith(fontSize: 10.sp),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  /// Helper method to build stat columns (Total Moving, Vehicle, Helpers, etc.)
  Widget buildStatColumn(String title, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(title, style: AppStyles.titleMedium.copyWith(fontSize: 10.sp)),
          SizedBox(height: 8.h),
          Text(value, style: AppStyles.titleMedium.copyWith(fontSize: 10.sp)),
        ],
      ),
    );
  }

  /// Helper method to build photo items for the photo section
  Widget buildPhotoSectionItem(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Image.asset(
        imagePath,
        width: 100.w,
        height: 145.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
