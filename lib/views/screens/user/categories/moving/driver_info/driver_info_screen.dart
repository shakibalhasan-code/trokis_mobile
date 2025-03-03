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
import 'package:trokis_mobile/views/screens/user/categories/moving/payment_method/components/white_container.dart';

class DriverInfoScreen extends StatelessWidget {
  const DriverInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar:
          WidgetsHelper.showAppBar(title: 'Driver Information', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.h),
        child: Column(
          children: [
            SizedBox(height: 57.h),
            WhiteContainer(
                child: Text(
              textAlign: TextAlign.center,
              'Thank you for choosing us for your next moving. now you can contact “NAME OF THE DRIVER” directly',
              style: AppStyles.titleMedium
                  .copyWith(color: Colors.black, fontSize: 14.sp),
            )),
            Expanded(
                child: Center(
              child: Container(
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
                                width: 24.w,
                                height: 24.h,
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
                                Text(
                                  'See Profile',
                                  style: AppStyles.titleMedium.copyWith(
                                      color: AppStyles.greenColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: SecondaryButton(
                                  buttonColor: Color(0xff3367CD),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.mail_outlined,
                                          color: Colors.white),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        'Send Message',
                                        style: AppStyles.titleMedium.copyWith(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ))),
                          SizedBox(width: 10.w),
                          Expanded(
                              child: SecondaryButton(
                                  buttonColor: Color(0xff5BB458),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.call, color: Colors.white),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        'Call',
                                        style: AppStyles.titleMedium.copyWith(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  )))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
            MyGlobButton(
                text: 'Back to home',
                isOutline: false,
                onTap: () => Get.offAllNamed(AppRoute.tab))
          ],
        ),
      ),
    );
  }
}
