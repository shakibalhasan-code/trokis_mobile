import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trokis_mobile/views/screens/global_widgets/bottom_nav.dart';
import '../../controller/tab_controller.dart';

class MainTabScreen extends StatelessWidget {
  MainTabScreen({super.key});

  final myTabController = Get.find<MyTabController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          () => myTabController.screens[myTabController.selectedIndex.value]),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
          child: Obx(() => buildBottomRow()),
        ),
      ),
    );
  }

  Row buildBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(myTabController.screens.length, (index) {
        return GestureDetector(
          onTap: () {
            myTabController.selectedIndex.value = index; // Update index on tap
          },
          child: BottomNav(
            iconPath: myTabController.tabs[index]['icon']!, // Fixed key name
            title: myTabController.tabs[index]['label']!,
            isSelected: myTabController.selectedIndex.value ==
                index, // Correct selection check
          ),
        );
      }),
    );
  }
}
