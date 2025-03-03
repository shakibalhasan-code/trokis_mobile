import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:trokis_mobile/controller/user_app_controller/activity_controller.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';

Container move_completed_section() {
  final controller = Get.find<ActivityController>();

  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(AppConstant.doneIcon,
                    width: 20.w, height: 20.h),
                SizedBox(width: 5.w),
                Text(
                  'Move Completed',
                  style: AppStyles.titleMedium
                      .copyWith(color: Colors.black, fontSize: 16.sp),
                )
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              'Please confirm that all your belongings have been safely delivered to your new location.',
              style: AppStyles.titleMedium
                  .copyWith(color: Colors.black, fontSize: 12.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Obx(() => Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r)),
                    value: controller.isCheckedPolicy.value,
                    onChanged: (value) =>
                        controller.isCheckedPolicy.value = value!)),
                Expanded(
                  child: Text(
                    'I confirm that my belongings have been delivered and there is nothing pending.',
                    style: AppStyles.titleMedium.copyWith(fontSize: 10.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Row(
              children: [
                Expanded(
                  child: MyGlobButton(
                    text: 'Support',
                    isOutline: true,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: MyGlobButton(
                    onTap: () => controller.moveStatus.value = 'finished',
                    text: 'Approve',
                    isOutline: false,
                  ),
                )
              ],
            )
          ],
        )),
  );
}
