import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/custom_text_container.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/white_card_widget.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/payment_method/components/white_container.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Payment Method', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // ✅ Fix unbounded height issue
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),

              /// Title
              Text(
                'How will you pay the deposit for your next move?',
                textAlign: TextAlign.center,
                style: AppStyles.titleMedium.copyWith(
                  fontSize: 17.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 50.h),

              /// Info Card
              CustomTextContainer(
                cardColor: AppStyles.simpleGrey,
                text:
                    'To secure your moving and the price received, you need to pay \$(15% of the total) first. You will pay the balance directly to the moving guys the day of the moving or in the app.',
              ),

              /// Payment Options
              SizedBox(height: 15.h),
              WhiteContainer(
                child: Row(
                  children: [
                    SizedBox(
                      width: 62.w,
                      height: 53.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          AppConstant.storeImage,
                          width: 40.w,
                          height: 40.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),

                    /// Payment Info (Constrained Properly)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Online Store',
                            style: AppStyles.titleMedium.copyWith(
                                color: AppStyles.textColor, fontSize: 12.sp),
                          ),
                          Text(
                            'Pago de compra online',
                            style: AppStyles.titleMedium.copyWith(
                                color: AppStyles.textColor, fontSize: 12.sp),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            '\$13762.00', // ✅ Format currency
                            style: AppStyles.titleMedium.copyWith(
                              color: AppStyles.textColor,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15.h),

              /// Payment Methods List
              _buildPaymentList(),

              SizedBox(height: 15.h),

              /// Confirm Button
              MyGlobButton(
                text: 'Confirm',
                isOutline: false,
                onTap: () => Get.toNamed(AppRoute.driverInfo),
              ),
            ],
          ),
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
