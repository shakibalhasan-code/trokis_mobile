import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/support/support_screen.dart';

Padding mover_info_section() {
  return Padding(
    padding: EdgeInsets.all(15.h),
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 38.w,
              height: 38.h,
              child: RippleWave(
                  color: AppStyles.buttonGreen,
                  repeat: true,
                  child: const SizedBox()),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Loading your belongings into the truck',
                style: AppStyles.titleMedium
                    .copyWith(fontSize: 16.sp, color: Colors.black),
              ),
            )
          ],
        ),
        SizedBox(height: 8.h),

        ///vehicle info
        Row(
          children: [
            SizedBox(
              width: 53.w,
              height: 53.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.asset(
                  AppConstant.carImage,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sabbir Hossein',
                  style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                ),
                Text(
                  'Plate: CPN698',
                  style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                ),
              ],
            )
          ],
        ),

        ///mover_profile_info
        Row(
          children: [
            SizedBox(
              width: 48.w,
              height: 48.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.asset(
                  AppConstant.moverImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sabbir Hossein',
                  style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                ),

                /// Reviews
                Row(
                  children: [
                    Icon(Icons.star, color: AppStyles.ratingColor, size: 18.r),
                    SizedBox(width: 5.w),
                    Text('5.0',
                        style: AppStyles.titleMedium
                            .copyWith(color: Colors.black, fontSize: 12.sp)),
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
            )
          ],
        ),
        SizedBox(height: 10.h),

        ///contact_details
        Row(
          children: [
            Expanded(
              child: SecondaryButton(
                  onTap: () => Get.to(SupportScreen(isBack: true)),
                  buttonColor: AppStyles.buttonGreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppConstant.messageIcon,
                        width: 24.w,
                        height: 24.h,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Chat',
                        style:
                            AppStyles.titleMedium.copyWith(color: Colors.white),
                      )
                    ],
                  )),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: SecondaryButton(
                  buttonColor: AppStyles.buttonGreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.call,
                        size: 24.h,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Call',
                        style:
                            AppStyles.titleMedium.copyWith(color: Colors.white),
                      )
                    ],
                  )),
            )
          ],
        ),
        SizedBox(height: 15.h),

        ///share
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SecondaryButton(
              buttonColor: AppStyles.greenColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Share your moving status',
                      style: AppStyles.titleMedium
                          .copyWith(color: Colors.white, fontSize: 14.sp),
                    ),
                    SizedBox(width: 10.w),
                    SvgPicture.asset(
                      AppConstant.shareIcon,
                      color: Colors.white,
                      width: 24.w,
                      height: 24.h,
                    )
                  ],
                ),
              )),
        )
      ],
    ),
  );
}
