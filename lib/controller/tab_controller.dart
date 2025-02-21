import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';

import '../views/screens/user/account/account_screen.dart';
import '../views/screens/user/activity/activity_screen.dart';
import '../views/screens/user/chat/chat_screen.dart';
import '../views/screens/user/home/home_screen.dart';


class MyTabController extends GetxController {
  RxInt selectedIndex = 0.obs; // Reactive selected index

  final List<Map<String, String>> tabs = [
    {'icon': AppConstant.homeIcon, 'label': 'Home'},
    {'icon': AppConstant.activityIcon, 'label': 'Activity'},
    {'icon': AppConstant.chatIcon, 'label': 'Chat'},
    {'icon': AppConstant.personIcon, 'label': 'Account'},
  ];

  final List<Widget> screens = [
    HomeScreen(),
    ActivityScreen(),
    ChatScreen(),
    AccountScreen(),
  ];
}
