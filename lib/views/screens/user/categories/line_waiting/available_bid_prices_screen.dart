import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/controller/user_app_controller/line_waiting_controller.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/user/categories/line_waiting/components/movers_item_line.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/items/movers_item.dart';

class AvailableBidPricesScreen extends StatelessWidget {
  AvailableBidPricesScreen({super.key});
  final lineController = Get.find<LineWaitingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(
          title: 'Line waiting estimates', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sortByDropdown(),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return LineMoversItem(
                        onTap: () => Get.toNamed(AppRoute.paymentMethodLining));
                  }),
            )
          ],
        ),
      ),
    );
  }

  Align sortByDropdown() {
    return Align(
      alignment: Alignment.topRight,
      child: Obx(() {
        final selectedValue = lineController.selectedShortingMovers.value;
        final itemsList = lineController.shortingMovers;

        // Ensure the selected value exists in the list or set to null
        final validSelectedValue =
            itemsList.contains(selectedValue) ? selectedValue : null;

        return Container(
          width: 100.w,
          height: 34.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: Colors.black),
          ),
          child: DropdownButton<String>(
            value: validSelectedValue, // ✅ Ensures valid value
            items: itemsList.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item,
                    style: AppStyles.titleMedium
                        .copyWith(fontSize: 12.sp, color: Colors.black)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                lineController.selectedShortingMovers.value = newValue;
              }
            },
            underline: SizedBox(),
            isExpanded: true,
            icon: SvgPicture.asset(AppConstant.arrowDownIcon,
                width: 24.w, height: 24.h),
          ),
        );
      }),
    );
  }
}
