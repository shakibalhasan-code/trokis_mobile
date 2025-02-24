import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trokis_mobile/controller/user_app_controller/movers_controller.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class AvailableMoversScreen extends StatelessWidget {
  AvailableMoversScreen({Key? key}) : super(key: key);

  final moversController = Get.find<MoversController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: AppBar(
        title: Text('Estimates', style: AppStyles.titleMedium),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        ),
        actions: [
          // Wrap in a Padding if you want spacing on the right edge
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              height: 34.h,
              width: 100.w,
              // Horizontal padding to control space around text & icon
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppStyles.borderColor),
              ),
              child: DropdownButtonHideUnderline(
                child: Obx(
                  () => DropdownButton<String>(
                    // Removes extra vertical space
                    isDense: false,
                    // A smaller icon for a compact look
                    icon: const Icon(Icons.arrow_drop_down,
                        size: 18, color: Colors.black),
                    // Current selected value
                    value: moversController.selectedShortingMovers.value,
                    hint: Text(
                      'Sort by',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                    onChanged: (v) {
                      moversController.selectedShortingMovers.value = v!;
                    },
                    items: moversController.shortingMovers.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: AppStyles.titleMedium
                                .copyWith(fontSize: 14.sp)),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
