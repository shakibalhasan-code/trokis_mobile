import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';

class WidgetsHelper {
  static Future<T?> userBottomSheet<T>() {
    return Get.bottomSheet<T>(
      Container(
        width: double.infinity,
        height: 225.h,
        decoration: BoxDecoration(
          color: Colors.white, // Move color inside decoration
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r))
        ),
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Avoid unnecessary space
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyGlobButton(
                text: 'Register as User',
                isOutline: false,
                onTap: () {
                  Get.back(result: 'user'); // Returns "user" when tapped
                  Get.toNamed(AppRoute.forgot);
                },
              ),
              SizedBox(height: 15.h),
              MyGlobButton(
                text: 'Register as Driver',
                isOutline: true,
                onTap: () {
                  Get.back(result: 'driver'); // Returns "driver" when tapped
                  Get.toNamed(AppRoute.forgot);

                },
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true, // Allows bottom sheet to expand fully if needed
    );
  }
}
