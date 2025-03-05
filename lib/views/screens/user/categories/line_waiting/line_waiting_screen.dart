import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/controller/user_app_controller/line_waiting_controller.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_text_feild.dart';

class LineWaitingScreen extends StatelessWidget {
  LineWaitingScreen({super.key});
  final lineWaitingController = Get.find<LineWaitingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Line waiting', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            MyTextFeild(
              inputType: TextInputType.text,
              controller: lineWaitingController.locationController,
              hintText: 'Enter location',
              colorIcon: Colors.grey,
              suffixSVGIconPath: AppConstant.locationIcon,
            ),
            SizedBox(height: 10.h),
            MyTextFeild(
              inputType: TextInputType.text,
              controller: lineWaitingController.locationController,
              hintText: 'Address line 2 (apt, office, floor, etc)',
              colorIcon: Colors.grey,
              maxLines: 1,
              suffixSVGIconPath: AppConstant.locationIcon,
            ),
            SizedBox(height: 10.h),

            /// Date & Time Pickers
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final date = await lineWaitingController.selectDate();
                      if (date != null) {
                        lineWaitingController.selectedDate.value =
                            date.toString().split(' ')[0];
                      }
                    },
                    child: Obx(() => MyTextFeild(
                          isEditable: false,
                          inputType: TextInputType.datetime,
                          controller:
                              lineWaitingController.selectDateController,
                          hintText: lineWaitingController.selectedDate.value,
                          suffixSVGIconPath: AppConstant.dateIcon,
                          colorIcon: Color(0xff545454),
                        )),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await lineWaitingController.selectTime();
                    },
                    child: Obx(() => MyTextFeild(
                          isEditable: false,
                          inputType: TextInputType.datetime,
                          controller:
                              lineWaitingController.selectTimeController,
                          hintText: lineWaitingController.selectedTime.value,
                          suffixSVGIconPath: AppConstant.timeIcon,
                          colorIcon: Color(0xff545454),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            MyTextFeild(
                inputType: TextInputType.text,
                controller: lineWaitingController.describeController,
                hintText: 'Describe in details what you need',
                maxLines: 3,
                colorIcon: Colors.grey),

            SizedBox(height: 10.h),
            MyTextFeild(
                inputType: TextInputType.text,
                controller: lineWaitingController.describeController,
                hintText: 'Your offer \$ (optional)',
                maxLines: 3,
                colorIcon: Colors.grey),
            const Spacer(),
            MyGlobButton(
              onTap: () => Get.toNamed(AppRoute.reviewLineWaiting),
              text: 'Next',
              isOutline: false,
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
