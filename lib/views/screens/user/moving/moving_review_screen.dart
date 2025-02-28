import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/white_card_widget.dart';
import 'package:trokis_mobile/views/screens/user/moving/helper_widget/moving_widgets_helper.dart';

class MovingReviewScreen extends StatelessWidget {
  const MovingReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text('Moving Review', style: AppStyles.titleMedium),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Starting address section
              buildAddressSection(
                title: 'Starting address :',
                address: '2972 Westheimer Rd. Santa Ana, Illinois ',
                locationType: 'House',
                floorLevel: '04',
                elevator: 'Normal elevator',
                parking: 'The parking is right outside the house',
              ),
              SizedBox(height: 10.h),
              // Date and time section
              buildDateTimeSection(),
              SizedBox(height: 10.h),
              // Destination address section
              buildAddressSection(
                title: 'Destination address',
                address: '2972 Westheimer Rd. Santa Ana, Illinois ',
                locationType: 'House',
                floorLevel: '04',
                elevator: 'Normal elevator',
                parking: 'The parking is right outside the house',
              ),
              SizedBox(height: 10.h),
              // White card with description text
              WhiteCardWidget(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ',
                  style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                ),
              ),
              SizedBox(height: 10.h),
              // Items section title
              Text(
                'Items',
                style: AppStyles.titleMedium.copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 10.h),
              // Items section content
              buildItemsSection(isMoving: true),
              SizedBox(height: 10.h),

              ///button
              MyGlobButton(
                text: 'Next',
                isOutline: false,
                onTap: () => Get.toNamed(AppRoute.getPrices),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
