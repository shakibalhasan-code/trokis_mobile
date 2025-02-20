import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class SecondaryButton extends StatelessWidget {
  final Widget child;
  const SecondaryButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppStyles.simpleBlack,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: child),
    );
  }
}
