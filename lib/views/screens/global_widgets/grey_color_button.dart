import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class GreyColorButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  const GreyColorButton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Color(0xffF3F4F6),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Center(
            child: Text(buttonText,
                style: AppStyles.titleMedium.copyWith(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
