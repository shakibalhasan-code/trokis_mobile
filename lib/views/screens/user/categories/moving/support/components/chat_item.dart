import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

class ChatItem extends StatelessWidget {
  final bool isSender;
  final String message;
  final String time;

  const ChatItem(
      {super.key,
      required this.isSender,
      required this.message,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        // Displaying the timestamp above the message bubble
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSender ? Color(0xff545454) : Color(0xffE6E6E6),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(isSender ? 4 : 18),
                  bottomLeft: Radius.circular(isSender ? 18 : 4),
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Text(
                message,
                style: AppStyles.titleMedium.copyWith(
                    color: isSender ? Colors.white : Colors.black,
                    fontSize: 12.sp),
              ),
            ),
            SizedBox(width: 5.w),
            if (isSender) ...[
              // For sent messages, show the status icon after the message
              SvgPicture.asset(
                AppConstant.doneBorderIcon,
                color: Color(0xff545454),
                width: 16.w,
                height: 16.h,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
