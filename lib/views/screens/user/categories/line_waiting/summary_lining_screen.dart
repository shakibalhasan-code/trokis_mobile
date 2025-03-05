import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:trokis_mobile/controller/user_app_controller/big_item_controller.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';

class SummaryLiningScreen extends StatelessWidget {
  const SummaryLiningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Summary', isBack: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location',
                            style: AppStyles.titleMedium
                                .copyWith(fontSize: 14.sp)),
                        Text('Rupatoli,Barishal',
                            style: AppStyles.titleMedium
                                .copyWith(fontSize: 10.sp)),
                        SizedBox(height: 10.h),
                        Text('Apt, suite, building, floor,etc.',
                            style: AppStyles.titleMedium
                                .copyWith(fontSize: 14.sp)),
                        SizedBox(height: 10.h),
                        Text('Date: 12-12-2024',
                            style: AppStyles.titleMedium
                                .copyWith(fontSize: 14.sp)),
                        SizedBox(height: 10.h),
                        Text('Time: 10.45 am',
                            style: AppStyles.titleMedium
                                .copyWith(fontSize: 14.sp)),
                        SizedBox(height: 10.h),
                        Text('Deposit: \$50.000',
                            style: AppStyles.titleMedium
                                .copyWith(fontSize: 14.sp)),
                        SizedBox(height: 10.h),
                        Text('Due: \$450.000',
                            style: AppStyles.titleMedium
                                .copyWith(fontSize: 14.sp)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 38.h,
          ),
          Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hired person',
                      style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
                    ),
                    driverArrivingSection()
                  ],
                ),
              ))
        ],
      ),
    );
  }

  static Widget driverArrivingSection() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(
              //       child: Center(
              //         child: Text('Arriving at 2:32pm',
              //             style: AppStyles.titleMedium.copyWith(
              //                 fontSize: 16.sp, fontWeight: FontWeight.w500)),
              //       ),
              //     ),
              //     Icon(Icons.share, color: Colors.black)
              //   ],
              // ),
              // SizedBox(height: 10.h),
              // Row(
              //   children: [
              //     SizedBox(
              //         width: 30.w,
              //         height: 30.h,
              //         child: RippleWave(
              //             child: SizedBox(), color: AppStyles.buttonGreen)),
              //     SizedBox(width: 8.w),
              //     Text(
              //       'On the way to pick up location',
              //       style: AppStyles.titleMedium.copyWith(fontSize: 16.sp),
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              Row(
                children: [
                  ///profile
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60.h,
                          width: 60.w,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 50.w,
                                height: 50.h,
                                child: ClipRRect(
                                  child: Image.asset(AppConstant.moverImage,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(2.r)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        size: 11,
                                        Icons.star,
                                        color: AppStyles.ratingColor,
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        '5.0',
                                        style: AppStyles.titleMedium
                                            .copyWith(fontSize: 10.sp),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text('Sabbir Hossein',
                            style:
                                AppStyles.titleMedium.copyWith(fontSize: 14.sp))
                      ],
                    ),
                  ),

                  ///car
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('CPN698',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 14.sp)),
                      SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: ClipRRect(
                          child: Image.asset(
                            AppConstant.carImage,
                          ),
                        ),
                      ),
                      Text('White Nissan NP300',
                          style:
                              AppStyles.titleMedium.copyWith(fontSize: 14.sp)),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 15.h,
              ),

              ///CONTACT SECTION
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                        buttonColor: AppStyles.buttonGreen,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppConstant.messageIcon,
                                width: 20.w,
                                height: 20.h,
                                color: Colors.white,
                              ),
                              SizedBox(width: 15.w),
                              Text(
                                'Send a message',
                                style: AppStyles.titleMedium.copyWith(
                                    color: Colors.white, fontSize: 14.sp),
                              )
                            ],
                          ),
                        )),
                  ),
                  SizedBox(width: 40.w),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          color: AppStyles.buttonGreen,
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              MyGlobButton(text: 'Back to home', isOutline: false)
            ],
          ),
        ),
      );
}
