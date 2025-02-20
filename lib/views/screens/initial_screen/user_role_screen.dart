import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';

import '../../../core/utils/app_route.dart';

class UserRoleScreen extends StatelessWidget {
  const UserRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 220.w,
              height: 200.h,
              child: Image.asset(AppConstant.coverLogo),
            ),
             SizedBox(height: 50.h),

            MyGlobButton(onTap: (){
              Get.toNamed(AppRoute.login);
            },text: 'Login',isOutline: false,),
             SizedBox(height: 5.h,),
            MyGlobButton(onTap: (){},text: 'Use as Guest',isOutline: true,),

          ],
        ),
      )
    );  
  }
}