import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trokis_mobile/controller/user_app_controller/movers_controller.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/user/moving/items/movers_item.dart';
import 'package:trokis_mobile/views/screens/user/moving/items/moving_category_item.dart';

class AvailableMoversScreen extends StatelessWidget {
  AvailableMoversScreen({Key? key}) : super(key: key);

  final moversController = Get.find<MoversController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: AppBar(
        title: Text('Estimates',
            style: AppStyles.titleMedium
                .copyWith(fontSize: 18.sp, color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        ),
        actions: [
          actionsWidget(),
          SizedBox(width: 10.w),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.h), // ✅ Set height properly
          child: Container(
            height: 50.h, // ✅ Fix height
            padding: EdgeInsets.symmetric(horizontal: 10.w),

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // ✅ Fix overflow issue
              child: Row(
                children: List.generate(
                    moversController.movingCategories.length, (index) {
                  final categoryName = moversController.movingCategories[index];
                  return Obx(() => MovingCategoryItem(
                      onTap: () => moversController
                          .selectedMoversCategory.value = categoryName,
                      categoryName: categoryName,
                      isSelected: categoryName ==
                          moversController.selectedMoversCategory.value));
                }),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return MoversItem(
              onTap: () => Get.toNamed(AppRoute.moverDetails),
            );
          },
        ),
      ),
    );
  }

  Widget actionsWidget() {
    return Obx(() => Container(
          width: 100.w,
          height: 34.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: Colors.black),
          ),
          child: DropdownButton<String>(
            value: moversController
                .selectedShortingMovers.value, // ✅ Fix: Bind to selected value
            items: moversController.shortingMovers.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item,
                    style: AppStyles.titleMedium
                        .copyWith(fontSize: 12.sp, color: Colors.black)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                moversController.selectedShortingMovers.value = newValue;
              }
            },
            underline: SizedBox(),
            isExpanded: true,
            icon: SvgPicture.asset(AppConstant.arrowDownIcon,
                width: 24.w, height: 24.h),
          ),
        ));
  }
}
