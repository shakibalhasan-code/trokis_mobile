import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/auth/components/auth_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 23.w
          ),
          child: SafeArea(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h,),
            SizedBox(width: 220.w,height: 200.h,
              child: Image.asset(AppConstant.mainLogo),),



             ///number_field_section
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Enter your mobile number',style: AppStyles.titleMedium.copyWith(color: Colors.black)),
                  SizedBox(height: 8.h,),
                 TextFormField(
                   decoration: InputDecoration(
                     fillColor: Colors.white,
                       filled: true,
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r))
                   ),
                 ),
                  SizedBox(height: 10.h),
                 MyGlobButton(text: 'Continue',onTap: (){
                   WidgetsHelper.userBottomSheet();
                 },isOutline: false,)
               ],
             ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Divider()),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text('or',style: AppStyles.titleMedium),
                  ),
                  Expanded(child: Divider()),

                ],
              ),
              SizedBox(height: 10.h,),
              AuthButton(iconPath: AppConstant.googleIcon, authText: 'google'),
              SizedBox(height: 8.h,),
              AuthButton(iconPath: AppConstant.facebookIcon, authText: 'facebook'),
              SizedBox(height: 8.h,),

              AuthButton(iconPath: AppConstant.mailIcon, authText: 'email'),


          ],)),
        ),
      ),
    );
  }


}
