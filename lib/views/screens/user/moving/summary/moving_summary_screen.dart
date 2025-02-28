import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/white_card_widget.dart';
import 'package:trokis_mobile/views/screens/user/moving/helper_widget/moving_widgets_helper.dart';

class MovingSummaryScreen extends StatelessWidget {
  const MovingSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Moving Summary'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///moving_summary
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Starting address section
                  buildAddressSection(
                    title: 'Starting address :',
                    address: '2972 Westheimer Rd. Santa Ana, Illinois ',
                    locationType: 'House',
                    floorLevel: '04',
                    elevator: 'Normal elevator',
                    parking: 'The parking is right outside the house',
                  ),
                  SizedBox(height: 10.h),
                  // Date and time section
                  buildDateTimeSection(),
                  SizedBox(height: 10.h),
                  // Destination address section
                  buildAddressSection(
                    title: 'Destination address',
                    address: '2972 Westheimer Rd. Santa Ana, Illinois ',
                    locationType: 'House',
                    floorLevel: '04',
                    elevator: 'Normal elevator',
                    parking: 'The parking is right outside the house',
                  ),
                  SizedBox(height: 10.h),
                  // White card with description text
                  WhiteCardWidget(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Items section title
                  Text(
                    'Items',
                    style: AppStyles.titleMedium.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: 10.h),
                  // Items section content
                  buildItemsSection(isMoving: false),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Moving done by',
                      style: AppStyles.titleMedium
                          .copyWith(color: Colors.black, fontSize: 14.sp),
                    ),

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
                              style: AppStyles.titleMedium
                                  .copyWith(fontSize: 12.sp),
                            ),
                            Text(
                              'Plate: CPN698',
                              style: AppStyles.titleMedium
                                  .copyWith(fontSize: 12.sp),
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
                              style: AppStyles.titleMedium
                                  .copyWith(fontSize: 12.sp),
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
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),

                    ///contact_details
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                              onTap: () => Get.toNamed(AppRoute.support),
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
                                    style: AppStyles.titleMedium
                                        .copyWith(color: Colors.white),
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
                                    style: AppStyles.titleMedium
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                    SizedBox(height: 15.h),

                    ///share
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: SecondaryButton(
                          buttonColor: AppStyles.greenColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Share your moving status',
                                  style: AppStyles.titleMedium.copyWith(
                                      color: Colors.white, fontSize: 14.sp),
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
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SizedBox(
                width: double.infinity,
                child: Expanded(
                  child: SecondaryButton(
                      onTap: () => Get.offAllNamed(AppRoute.tab),
                      child: Center(
                        child: Text(
                          'Go to home',
                          style: AppStyles.titleMedium
                              .copyWith(color: Colors.black),
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
