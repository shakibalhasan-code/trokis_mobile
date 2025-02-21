import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/themes/app_styles.dart';
import '../../global_widgets/secondary_button.dart';

class AuthButton extends StatelessWidget {
  final String iconPath;
  final String authText;
  final Color ? color;
  const AuthButton({super.key, required this.iconPath, required this.authText, this.color});

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(iconPath,width: 18.w,height: 18.h,color: color,),
        SizedBox(width: 8.w),
        Text('Continue with $authText',style: AppStyles.titleMedium.copyWith(color: Colors.black))
      ],
    ));
  }
}
