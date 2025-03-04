import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class MyRippleWaver extends StatelessWidget {
  final Color rippleColor;
  const MyRippleWaver({super.key, required this.rippleColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 30.w,
        height: 30.h,
        child: RippleWave(child: SizedBox(), color: AppStyles.greenColor));
  }
}
