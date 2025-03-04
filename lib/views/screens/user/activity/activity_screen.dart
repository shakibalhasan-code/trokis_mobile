import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:trokis_mobile/controller/user_app_controller/activity_controller.dart';
import 'package:trokis_mobile/core/services/map_services.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_google_map.dart';
import 'package:trokis_mobile/views/screens/global_widgets/secondary_button.dart';
import 'package:trokis_mobile/views/screens/user/activity/sections/move_completed_section.dart';
import 'package:trokis_mobile/views/screens/user/activity/sections/move_finished_section.dart';
import 'package:trokis_mobile/views/screens/user/activity/sections/mover_info_section.dart';

class ActivityScreen extends StatefulWidget {
  ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final _mapServices = Get.find<MapServices>();
  final activityController = Get.find<ActivityController>();

  @override
  void initState() {
    changeSection();
    // TODO: implement initState
    super.initState();
  }

  Future<void> changeSection() async {
    await Future.delayed(Duration(seconds: 5));
    activityController.moveStatus.value = 'completed';
    // await Future.delayed(Duration(seconds: 5));
    // activityController.moveStatus.value = 'finished';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// Fullscreen Google Map
          Expanded(
              child: Stack(
            children: [
              Positioned.fill(
                left: 0,
                right: 0,
                child: SizedBox(width: double.infinity, child: MyGoogleMap()),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Obx(() => _mapServices.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox()),
              )
            ],
          )),

          Obx(() {
            if (activityController.moveStatus.value.contains('onway')) {
              return mover_info_section();
            } else if (activityController.moveStatus.value
                .contains('completed')) {
              return move_completed_section();
            } else if (activityController.moveStatus.value
                .contains('finished')) {
              return finished_move_section();
            }
            return SizedBox(child: Text('No data found..!'));
          })
        ],
      ),
    );
  }
}
