import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';

Container finished_move_section() => Container(
    color: Colors.white,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(AppConstant.doneIcon, width: 20.w, height: 20.h),
              SizedBox(width: 5.w),
              Text(
                'Move Completed',
                style: AppStyles.titleMedium
                    .copyWith(color: Colors.black, fontSize: 16.sp),
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
                      Icon(Icons.star,
                          color: AppStyles.ratingColor, size: 18.r),
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
          SizedBox(height: 15.h),
          Text(
            'Please pay your balance for \$4566 to the driver.',
            style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: MyGlobButton(
                  text: 'Pay with card',
                  isOutline: true,
                  onTap: () {},
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: MyGlobButton(
                  text: 'Finish',
                  isOutline: false,
                  onTap: () => Get.offAllNamed(AppRoute.movingSummary),
                ),
              )
            ],
          )
        ],
      ),
    ));
