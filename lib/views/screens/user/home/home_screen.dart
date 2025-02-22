import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/controller/user_app_controller/home_controller.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      body: SafeArea(
          child: Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 20.h, top: 20.h),
                  itemCount: homeController.homeCategory.length,
                  itemBuilder: (context, index) {
                    return categoryItemHome(index);
                  }))),
    );
  }

  Padding categoryItemHome(int index) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: InkWell(
        onTap: () => Get.toNamed(AppRoute.startingLocation),
        child: Container(
          width: double.infinity,
          height: 160.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Stack(
            children: [
              ///image
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    homeController.homeCategory[index]['image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),

              ///overlay
              Container(
                  decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8.r),
              )),

              ///center- title
              Center(
                  child: Text(
                homeController.homeCategory[index]['title'],
                style: AppStyles.titleMedium
                    .copyWith(fontSize: 25.sp, color: Colors.white),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
