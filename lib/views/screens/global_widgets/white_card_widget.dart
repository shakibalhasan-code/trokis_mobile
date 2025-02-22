import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class WhiteCardWidget extends StatelessWidget {
  final Widget child;
  const WhiteCardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: AppStyles.borderColor),
          borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 5.h),
        child: child,
      ),
    );
  }
}
