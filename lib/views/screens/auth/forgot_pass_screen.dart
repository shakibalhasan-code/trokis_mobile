import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/main_tab_screen.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(), icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,)),
      title: Text('Forgot Password',style: AppStyles.titleMedium.copyWith(color: Colors.black)),
      centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(height: 50.h),
                SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: Image.asset(AppConstant.mainLogo),
                ),
              Text('Verify Number',style: AppStyles.titleMedium.copyWith(fontSize: 23.sp,color: Colors.black),),
              SizedBox(height: 15.h),
              Text('Please enter the OTP code, We’ve sent you in your Number.',textAlign: TextAlign.center,style: AppStyles.titleMedium.copyWith(fontSize: 14.sp,color: Colors.black),),
              SizedBox(height: 20.h),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  borderRadius: BorderRadius.circular(50.r),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  borderWidth: 0.5,
                  activeFillColor: Colors.white,
                  activeColor: Colors.black, // Border color when active
                  inactiveColor: Colors.grey, // Border color when inactive
                  selectedColor: Colors.black, // Bor
                  inactiveFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);

                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                }, appContext: context,
              ),
              SizedBox(height: 10.h),
              MyGlobButton(text: 'Verify',isOutline: false,onTap: ()=> Get.offAndToNamed(AppRoute.tab))
            ],
          ),
        ),
      ),
    );
  }
}
