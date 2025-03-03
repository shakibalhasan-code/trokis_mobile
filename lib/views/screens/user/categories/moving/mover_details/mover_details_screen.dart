import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/custom_text_container.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/items/movers_item.dart';

class MoverDetailsScreen extends StatelessWidget {
  const MoverDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Estimate details', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoversItem(onTap: () {}),
            SizedBox(height: 10.h),
            Text('Pricing Details',
                style: AppStyles.titleMedium
                    .copyWith(color: Colors.black, fontSize: 14.sp)),
            SizedBox(height: 15.h),
            price_build_item(title: 'Total:', price: '\$500.000'),
            SizedBox(
              height: 8.h,
            ),
            price_build_item(title: 'Deposit:', price: '\$50.000'),
            const Divider(
              color: Colors.black,
            ),
            price_build_item(
                title: 'Balance after deposit', price: '\$450.000'),
            SizedBox(height: 15.h),
            CustomTextContainer(
                cardColor: AppStyles.babyBlueColor,
                text:
                    'To schedule and secure your next move, you need to pay a deposit of \$450.00 (10% of the total). The balance can be paid on the day of the moving through the app or directly to the moving staff.'),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                'View lease agreement with Driver >',
                style: AppStyles.titleMedium.copyWith(fontSize: 10.sp),
              ),
            ),
            SizedBox(height: 10.h),
            MyGlobButton(
              text: 'Hire',
              isOutline: false,
              onTap: () => Get.toNamed(AppRoute.paymentMethod),
            )
          ],
        ),
      ),
    );
  }

  Row price_build_item({required String title, required String price}) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.titleMedium
              .copyWith(fontSize: 12.sp, color: Colors.black),
        ),
        const Spacer(),
        Text(
          price,
          style: AppStyles.titleMedium
              .copyWith(fontSize: 12.sp, color: Colors.black),
        ),
      ],
    );
  }
}
