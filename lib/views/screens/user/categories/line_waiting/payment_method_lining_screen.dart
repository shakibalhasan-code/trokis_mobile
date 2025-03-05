import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/payment_method/components/white_container.dart';

class PaymentMethodLiningScreen extends StatelessWidget {
  const PaymentMethodLiningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(
          title: 'Choosee your payment method', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Text(
                'A deposit is required and securely held until the Line waiting is completed to cover the service provider’s time, fuel, and effort. \n If you choose to pay the deposit in cash, the service provider will need to meet you first before starting the Line waiting.\n For Line waiting that require cash payments (e.g., purchasing items or paying bills), you can provide the necessary funds when meeting the service provider.\n At Trokis, we partner with reliable, established local delivery businesses to ensure that all service providers are trustworthy and committed to completing Line waiting efficiently and professionally.\n If the service provider fails to show up after you’ve paid the deposit by card or transfer, your deposit will be fully refunded.'),
            SizedBox(height: 15.h),
            Row(
              children: [
                Text('Cash',
                    style: AppStyles.titleMedium.copyWith(fontSize: 14.sp)),
                SizedBox(width: 8.w),
                SvgPicture.asset(AppConstant.cashIcon)
              ],
            ),
            SizedBox(height: 20.h),

            /// Payment Methods List
            _buildPaymentList(),
            SizedBox(height: 20.h),
            MyGlobButton(
                onTap: () => Get.toNamed(AppRoute.liningSummary),
                text: 'Next',
                isOutline: false)
          ],
        ),
      ),
    );
  }

  /// 🔹 Payment List Builder
  Widget _buildPaymentList() {
    List<Map<String, String?>> paymentMethods = [
      {"icon": AppConstant.worldIcon, "title": "Tarjeta Crédito o Débito"},
      {"icon": AppConstant.timerIcon, "title": "Nequi"},
      {"icon": AppConstant.menuIcon, "title": "Bancolombia"},
      {"image": AppConstant.payImage, "title": "Daviplata"},
    ];

    return Column(
      children: List.generate(paymentMethods.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: WhiteContainer(
            child: _buildPaymentItem(
              imagePath: paymentMethods[index]['image'],
              iconPath: paymentMethods[index]['icon'],
              title: paymentMethods[index]['title']!,
            ),
          ),
        );
      }),
    );
  }

  /// 🔹 Payment Row Item (Ensured Proper Constraints)
  Row _buildPaymentItem(
      {String? imagePath, String? iconPath, required String title}) {
    return Row(
      children: [
        displayIcon(
            imagePath: imagePath, iconPath: iconPath), // ✅ Fix display issues
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            title,
            style: AppStyles.titleMedium.copyWith(
              color: Colors.black,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  /// 🔹 Display Icon Handling
  Widget displayIcon({String? imagePath, String? iconPath}) {
    if (imagePath != null) {
      return Image.asset(imagePath, width: 24.w, height: 24.h);
    } else if (iconPath != null) {
      return SvgPicture.asset(iconPath,
          width: 20.w, height: 20.h, color: Colors.black);
    } else {
      return Icon(Icons.credit_card,
          size: 24.w, color: Colors.black); // Default icon
    }
  }
}
