import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class BottomNav extends StatelessWidget {
  final String iconPath;
  final String title;
  final bool isSelected;

  const BottomNav({super.key, required this.iconPath, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Column(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: SvgPicture.asset(
              iconPath,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.contain, // Use scaleDown instead of cover
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            title,
            style: AppStyles.titleMedium.copyWith(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
