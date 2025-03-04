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
import 'package:trokis_mobile/views/screens/global_widgets/white_card_widget.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/payment_method/components/white_container.dart';

class FindingHelperScreen extends StatelessWidget {
  FindingHelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: LottieBuilder.asset(
                      width: 200.w,
                      height: 200.h,
                      AppConstant.deliveryBoyLottie),
                ),
              ],
            )),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurStyle: BlurStyle.solid,
                        blurRadius: 8,
                        spreadRadius: 2,
                        color: AppStyles.shadowColor)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We are finding Helpers willing to work with you, please wait!',
                  style: AppStyles.titleMedium
                      .copyWith(color: Colors.black, fontSize: 14.sp),
                ),
              ),
            ),
            SizedBox(height: 80.h),
            MyGlobButton(
              onTap: () => Get.toNamed(AppRoute.availableHelper),
              text: 'See available helpers',
              isOutline: false,
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
