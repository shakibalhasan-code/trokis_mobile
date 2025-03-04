import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class MyTextFeild extends StatelessWidget {
  final TextInputType inputType;
  final TextEditingController controller;
  final String hintText;
  final String? suffixSVGIconPath;
  final Color colorIcon;
  final bool? isEditable;
  final int? maxLines;
  const MyTextFeild(
      {super.key,
      required this.inputType,
      required this.controller,
      required this.hintText,
      this.suffixSVGIconPath,
      required this.colorIcon,
      this.maxLines,
      this.isEditable});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.r, color: AppStyles.borderColor),
          borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5),
        child: TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
            enabled: isEditable ?? true,
            hintText: hintText,
            hintStyle: AppStyles.titleMedium.copyWith(fontSize: 16.sp),
            border: InputBorder.none,
            suffixIcon: suffixSVGIconPath != null
                ? SizedBox(
                    width: 18.w,
                    height: 20.h,
                    child: SvgPicture.asset(
                      suffixSVGIconPath!,
                      color: colorIcon,
                    ),
                  )
                : SizedBox(),
            // Optionally, you can also adjust constraints:
            suffixIconConstraints: BoxConstraints(
              minWidth: 20.w,
              minHeight: 20.h,
            ),
          ),
          validator: (validator) {
            if (validator!.isEmpty) {
              return 'Please input something';
            }
          },
        ),
      ),
    );
  }
}
