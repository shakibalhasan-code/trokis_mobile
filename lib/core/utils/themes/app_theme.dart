import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class MyAppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppStyles.primaryColor,


    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppStyles.primaryColor,
          foregroundColor: AppStyles.whiteColor,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),

    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      border: InputBorder.none,
      outlineBorder: BorderSide(color: Colors.black,width: 1)
    )

    // inputDecorationTheme: InputDecorationTheme(
    //   fillColor:
    // )

  );
}