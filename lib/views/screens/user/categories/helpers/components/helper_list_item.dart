import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class HelperListItem extends StatelessWidget {
  final VoidCallback onTap;
  final bool? isSelected;
  const HelperListItem({super.key, required this.onTap, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: InkWell(
          onTap: onTap,
          child: SizedBox(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min, // ✅ Fix: Prevents unbounded height
                      children: [
                        Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // ✅ Fix alignment
                          children: [
                            /// Avatar
                            CircleAvatar(
                              radius: 30.r,
                              backgroundImage:
                                  AssetImage(AppConstant.moverImage),
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
                                          color: AppStyles.ratingColor,
                                          size: 18.r),
                                      SizedBox(width: 5.w),
                                      Text('5.0',
                                          style: AppStyles.titleMedium.copyWith(
                                              color: Colors.black,
                                              fontSize: 12.sp)),
                                      SizedBox(width: 5.w),
                                      Text('(837 Reviews)',
                                          style: AppStyles.titleMedium.copyWith(
                                              color: Color(0xff545454),
                                              fontSize: 12.sp)),
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
                            ),

                            /// Favorite & Price
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  AppConstant.heartIcon,
                                  color: Colors.red,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                                SizedBox(
                                    height:
                                        8.h), // ✅ Fix: Prevents infinite height
                                Text(
                                  '\$45.55',
                                  style: AppStyles.titleLarge.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF5F7F6),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
                                    style: AppStyles.titleMedium.copyWith(
                                        fontSize: 12.sp,
                                        color: Color(0xff545454)),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        Get.toNamed(AppRoute.moverProfile),
                                    child: Text(
                                      'See Profile',
                                      style: AppStyles.titleMedium.copyWith(
                                          color: AppStyles.greenColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp),
                                    ),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 8.w,
                  top: 8.h,
                  child: SvgPicture.asset(
                    AppConstant.doneBorderIcon,
                    height: 24.h,
                    width: 24.w,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
