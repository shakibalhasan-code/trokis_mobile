import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class MovingCategoryItem extends StatelessWidget {
  final String categoryName;
  final bool isSelected;
  final VoidCallback onTap;
  const MovingCategoryItem(
      {super.key,
      required this.categoryName,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: isSelected ? AppStyles.primaryColor : Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(categoryName,
            style: AppStyles.titleMedium.copyWith(
                fontSize: 14.sp,
                color: isSelected ? Colors.white : Colors.black)),
      ),
    );
  }
}
