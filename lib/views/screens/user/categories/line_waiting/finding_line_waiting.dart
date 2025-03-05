import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';

class FindingLineWaiting extends StatelessWidget {
  const FindingLineWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsHelper.showAppBar(title: '', isBack: true),
      backgroundColor: AppStyles.primaryBgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: LottieBuilder.asset(
                    AppConstant.deliveryBoyLottie,
                    width: 250.w,
                    height: 250.h,
                  ),
                )
              ],
            )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We are finding service providers available for your request, please wait!',
                  style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            MyGlobButton(
              onTap: () => Get.toNamed(AppRoute.lineWaitingBid),
              text: 'See available estimates',
              isOutline: false,
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
