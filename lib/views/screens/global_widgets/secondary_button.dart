import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class SecondaryButton extends StatelessWidget {
  final Color? buttonColor;
  final Widget child;
  final VoidCallback? onTap;
  final int? buttonHeight;
  const SecondaryButton(
      {super.key,
      required this.child,
      this.buttonColor,
      this.onTap,
      this.buttonHeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor ?? AppStyles.simpleBlack,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child:
            Padding(padding: EdgeInsets.symmetric(vertical: 8.h), child: child),
      ),
    );
  }
}
