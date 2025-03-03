import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/support/support_screen.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: InkWell(
        onTap: () => Get.to(SupportScreen(isBack: true)),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 48.w,
                        height: 48.h,
                        child: ClipRRect(
                          child: Image.asset(AppConstant.moverImage),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jane Cooper',
                              style: AppStyles.titleMedium.copyWith(
                                  color: Colors.black, fontSize: 16.sp)),
                          Text('hello how are you',
                              style: AppStyles.titleMedium.copyWith(
                                  color: Colors.black, fontSize: 12.sp))
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text('1:30 PM',
                              style: AppStyles.titleMedium.copyWith(
                                  color: Colors.black, fontSize: 10.sp))
                        ],
                      )
                    ],
                  ),
                ),
                const Divider()
              ],
            )),
      ),
    );
  }
}
