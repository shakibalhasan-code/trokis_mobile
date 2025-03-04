import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class MyGlobButton extends StatelessWidget {
  final String text;
  final bool? isOutline;
  final VoidCallback? onTap;
  final Color? textColor;

  const MyGlobButton(
      {super.key,
      required this.text,
      this.isOutline,
      this.onTap,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: isOutline == true
                ? AppStyles.whiteColor
                : AppStyles.primaryColor,
            border: Border.all(
                color: isOutline == true
                    ? AppStyles.primaryColor
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(12.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(text,
                  style: AppStyles.titleMedium.copyWith(
                      color: isOutline!
                          ? AppStyles.primaryColor
                          : AppStyles.whiteColor))
            ],
          ),
        ),
      ),
    );
  }
}
