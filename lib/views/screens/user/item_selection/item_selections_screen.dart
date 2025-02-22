import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trokis_mobile/controller/user_app_controller/item_selection_controller.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class ItemSelectionsScreen extends StatelessWidget {
  ItemSelectionsScreen({super.key});

  final itemsController = Get.find<ItemSelectionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text('Item Selections', style: AppStyles.titleMedium),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text('Select all your items', style: AppStyles.titleMedium),
            SizedBox(height: 20.h),
            // Wrap ListView.builder inside Expanded directly to handle scrolling
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SvgPicture.asset(
                        itemsController.itemsWithIcons[index][
                            'icon']!, // Use the controller to get the icon path
                        width: 24.w,
                        height: 24.h,
                      ),
                      title: Text(
                        itemsController.itemsWithIcons[index]['title']!,
                        style: AppStyles.titleMedium.copyWith(fontSize: 16.sp),
                      ),
                      trailing: SvgPicture.asset(
                        AppConstant.downArrowIcon,
                        width: 24.w,
                        height: 24.h,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
