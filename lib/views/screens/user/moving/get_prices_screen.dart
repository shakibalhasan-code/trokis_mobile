import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';

class GetPricesScreen extends StatelessWidget {
  const GetPricesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurStyle: BlurStyle.normal,
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              spreadRadius: 0)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: Text(
                        'Finding movers available for your move... \nWe will send you a notification for each new estimate you receive! \nYou may receive up to 20 estimates within the next few hours!',
                        style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 346.w,
                    height: 345.h,
                    child: RippleWave(
                        color: Colors.blue.shade200,
                        repeat: true,
                        child: const SizedBox()),
                  ),
                ],
              )),
              MyGlobButton(
                  text: 'See avaliable movers',
                  isOutline: false,
                  onTap: () => Get.offAllNamed(AppRoute.availableMovers)),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
