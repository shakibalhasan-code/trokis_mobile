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
    appBarTheme: AppBarTheme(
      backgroundColor: AppStyles.primaryBgColor,
      elevation: 0,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        border: InputBorder.none,
        outlineBorder: BorderSide(color: Colors.black, width: 1)),

    /// ✅ Custom Circular Progress Indicator Theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.black, // Change progress color
      circularTrackColor: Colors.grey.withOpacity(0.3), // Background color
      linearMinHeight: 5.0, // For linear progress indicators
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   fillColor:
    // )
  );
}
