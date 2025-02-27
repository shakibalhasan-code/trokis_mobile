import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class CustomTextContainer extends StatelessWidget {
  final Color cardColor;
  final String text;
  const CustomTextContainer(
      {super.key, required this.cardColor, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: AppStyles.titleMedium
              .copyWith(fontSize: 10.sp, color: Colors.black),
        ),
      ),
    );
  }
}
