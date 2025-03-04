import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';

class DepostiRequiredScreen extends StatelessWidget {
  const DepostiRequiredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Deposit required', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.r),
            Text(
                'A deposit is required and securely held for the helpers to cover their time, effort, and transportation costs \n \nThis ensures that if they arrive at the designated location and the customer is not present, the deposit will compensate them for their inconvenience. If a helper do not show up as scheduled, the deposit will be fully refunded to you.\n \nThe deposit will be deducted from the final payment once the job is successfully completed, providing a fair and transparent process for both customers and helpers.'),
            SizedBox(height: 10.h),
            Text(
              'Select Payment Method',
              style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Text(
                  'Cash',
                  style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 18.sp,
                )
              ],
            ),
            SizedBox(height: 15.h),
            MyGlobButton(
              text: 'Next',
              isOutline: false,
            )
          ],
        ),
      ),
    );
  }
}
