import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/controller/auth_controller.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/auth/components/auth_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                width: 220.w,
                height: 200.h,
                child: Image.asset(AppConstant.mainLogo),
              ),

              ///number_field_section
              Form(
                key: _formKey, // Attach the form key here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter your mobile number',
                        style: AppStyles.titleMedium
                            .copyWith(color: Colors.black)),
                    SizedBox(height: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            CountryCodePicker(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              boxDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r)),
                              mode: CountryCodePickerMode.bottomSheet,
                              onChanged: (country) {
                                print('Country code selected: ${country.code}');
                              },
                              initialSelection: 'US',
                              showFlag: true,
                              showDropDownButton: false,
                              textStyle: AppStyles.titleMedium.copyWith(
                                  fontSize: 14.sp), // ✅ Make text smaller
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w), // ✅ Adjust padding
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller:
                                      _authController.userPhoneNumberController,
                                  decoration: const InputDecoration(
                                    border: InputBorder
                                        .none, // ✅ Remove default border
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            14), // ✅ Adjust vertical padding
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    MyGlobButton(
                      text: 'Continue',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // Proceed if valid
                          WidgetsHelper.userBottomSheet();
                        }
                      },
                      isOutline: false,
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text('or', style: AppStyles.titleMedium),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              AuthButton(iconPath: AppConstant.googleIcon, authText: 'google'),
              SizedBox(
                height: 8.h,
              ),
              AuthButton(
                  iconPath: AppConstant.facebookIcon, authText: 'facebook'),
              SizedBox(
                height: 8.h,
              ),

              AuthButton(iconPath: AppConstant.mailIcon, authText: 'email'),
            ],
          )),
        ),
      ),
    );
  }
}
