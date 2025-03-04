import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

Container finding_nearby_section() {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Column(
      children: [
        Text(
          'Finding nearby rides',
          style: AppStyles.titleMedium
              .copyWith(color: Colors.black, fontSize: 16.sp),
        )
      ],
    ),
  );
}
