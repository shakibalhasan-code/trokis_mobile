import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/user/chat/components/chat_list_item.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/support/support_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Message', isBack: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ChatListItem();
            }),
      ),
    );
  }
}
