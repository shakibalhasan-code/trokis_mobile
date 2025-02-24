import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trokis_mobile/controller/user_app_controller/item_selection_controller.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_text_feild.dart';
import 'package:trokis_mobile/views/screens/global_widgets/white_card_widget.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text('Select all your items', style: AppStyles.titleMedium),
              SizedBox(height: 20.h),
              // Wrap ListView.builder inside Expanded directly to handle scrolling
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
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
              SizedBox(height: 20.h),
              WhiteCardWidget(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  children: [
                    Text(
                      'Upload photos/videos (Optional)',
                      style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.attach_file,
                      color: Colors.black,
                    )
                  ],
                ),
              )),
              SizedBox(
                height: 10.h,
              ),
              WhiteCardWidget(
                  child: Padding(
                      padding: EdgeInsets.all(0),
                      child: TextFormField(
                        controller: itemsController.additionalController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Additional Information',
                          hintStyle:
                              AppStyles.titleMedium.copyWith(fontSize: 16.sp),
                          border: InputBorder.none,
                        ),
                        validator: (validator) {
                          if (validator!.isEmpty) {
                            return 'Please input something';
                          }
                        },
                      ))),
              SizedBox(
                height: 10.h,
              ),
              MyGlobButton(
                text: 'Next',
                isOutline: false,
                onTap: () => Get.toNamed(AppRoute.movingReview),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
